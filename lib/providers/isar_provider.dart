import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_app/models/scan_model_isar.dart';
import 'package:qr_app/models/scan_models.dart';

class IsarProvider {
  static Isar? _dataBase;

  static final IsarProvider db = IsarProvider._();

  IsarProvider._();

  Future<Isar> get dataBase async {
    if (_dataBase != null) return _dataBase!;

    _dataBase = await initDB();

    return _dataBase!;
  }

  Future<Isar> initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.openSync([ScanModel2Schema], directory: dir.path);
  }

  // Crear registros con rawInsert: se dee ingresar los valores de la tabla manual
  Future<int> nuevoScanRaw(ScanModel2 nuevoScan) async {
    final db = await dataBase;
    return db.writeTxn(() => db.scanModel2s.put(nuevoScan));
  }

// Crear Registro con insert: mas corto de utilizar
  Future<int> nuevoScan(ScanModel2 nuevoScan) async {
    final db = await dataBase;
    return db.writeTxn(() => db.scanModel2s.put(nuevoScan));
  }

  //Obtener Registros
  Future<ScanModel?> getScanById(int id) async {
    final db = await dataBase;
    final res = [];
    return res.isNotEmpty
        ? ScanModel.fromJson(
            res.first) // res.first: obtiene el primer resultado de la lista
        : null;
  }
}
