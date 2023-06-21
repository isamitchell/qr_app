import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:qr_app/models/scan_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _dataBase;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get dataBase async {
    if (_dataBase != null) return _dataBase!;

    _dataBase = await initDB();

    return _dataBase!;
  }

  Future<Database> initDB() async {
    //Path de donde almacenaremos la base de datos (es la ruta)
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // join nos permite unir o armar las partes del path | la extension .db es importante ya que es la que identifica el sqlite
    final path = join(documentsDirectory.path, 'ScansDB.db');

    print(path);

    //Crear Base de Datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        //ejecutar query
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      },
    );
  }

  // Crear registros con rawInsert: se dee ingresar los valores de la tabla manual
  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    //Verifica la base de datos
    final db = await dataBase;

    final res = await db.rawInsert('''
      INSERT INTO Scans(id, tipo, valor)
      VALUES ($id, '$tipo', '$valor')
''');
    return res;
  }

// Crear Registro con insert: mas corto de utilizar
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await dataBase;
    final res = await db.insert('Scans', nuevoScan.toJson());
    return res;
  }

  //Obtener Registros
  Future<ScanModel?> getScanById(int id) async {
    final db = await dataBase;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty 
    ? ScanModel.fromJson(res.first) // res.first: obtiene el primer resultado de la lista
    : null;
  }
}
