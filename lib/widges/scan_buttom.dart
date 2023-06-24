import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_app/models/scan_model_isar.dart';
import 'package:qr_app/providers/isar_provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';

class ScanFloatingButtom extends StatelessWidget {
  const ScanFloatingButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);

        ScanListProvider().newScan(barcodeScanRes);
      },
      elevation: 0,
      child: const Icon(Icons.qr_code_scanner),
    );
  }
}
