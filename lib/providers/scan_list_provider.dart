import 'package:flutter/material.dart';
import 'package:qr_app/providers/isar_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel2> scans = [];
  String selectedType = 'http';

  newScan(String valor) async {
    final scanData = ScanModel2(valor: valor); //instancia
    final idScan =
        await IsarProvider.db.nuevoScan(scanData); // crea base de datos
    scanData.id = idScan; //Obteno el id y asigna a la instancia

    if (selectedType == scanData.tipo) {
      // valida el tipo de dato escaneado, para redibujar la interfaz
      scans.add(scanData); // asigno id obtenido a la lista del scanList
      notifyListeners();
    }
  }

  loadScans() async {
    final newscans = await IsarProvider.db.getAllScans();
    scans = [...newscans];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final newscans = await IsarProvider.db.getScansByType(type);
    scans = [...newscans];
    selectedType = type;
    notifyListeners();
  }

  deleteScans() async {
    await IsarProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  deleteScansById(int id) async {
    await IsarProvider.db.deleteScan(id);
    loadScansByType(selectedType); // vuelve a cargar los scans acxtualizados
  }
}
