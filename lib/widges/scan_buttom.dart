import 'package:flutter/material.dart';
import 'package:qr_app/models/scan_model_isar.dart';
import 'package:qr_app/providers/isar_provider.dart';

class ScanFloatingButtom extends StatelessWidget {
  const ScanFloatingButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        String barcodeScanRes = 'https://www.google.com';
        final scanData = ScanModel2(valor: barcodeScanRes);
        IsarProvider.db.nuevoScan(scanData);
      },
      elevation: 0,
      child: const Icon(Icons.qr_code_scanner),
    );
  }
}
