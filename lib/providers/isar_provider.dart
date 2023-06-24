import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_app/models/scan_model_isar.dart';
export 'package:qr_app/models/scan_model_isar.dart';

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
    if (Isar.getInstance() != null) {
      return Isar.getInstance()!;
    }
    return Isar.openSync([ScanModel2Schema], directory: dir.path);
  }

  // Crear Regitros: devuelve el id del ultimo scan realizado
  Future<int> nuevoScan(ScanModel2 nuevoScan) async {
    final db = await dataBase;
    return db.writeTxn(() => db.scanModel2s.put(nuevoScan));
  }

  //Obtener Registros
  Future<ScanModel2?> getScanById(int id) async {
    final db = await dataBase;
    return db.scanModel2s.get(id);
  }

  Future<List<ScanModel2>> getAllScans() async {
    final db = await dataBase;
    return db.scanModel2s.filter().idIsNotNull().findAll();
  }

  Future<List<ScanModel2>> getScansByType(String type) async {
    final db = await dataBase;
    return db.scanModel2s.where().tipoEqualTo(type).findAll();
  }

  Future<bool> deleteScan(int id) async {
    final db = await dataBase;
    return db.writeTxn(() => db.scanModel2s.delete(id));
  }

  Future<int> deleteAllScan() async {
    final db = await dataBase;
    return db.writeTxn(() => db.scanModel2s.filter().idIsNotNull().deleteAll());
  }
}
