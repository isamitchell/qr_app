import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:qr_app/providers/providers.dart';
import 'package:qr_app/utils/utils.dart';

class ScanFloatingButtom extends StatelessWidget {
  const ScanFloatingButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final newScan = await scanListProvider.newScan(barcodeScanRes);

        launchUrlView(context, newScan);
      },
      elevation: 0,
      child: const Icon(Icons.qr_code_scanner),
    );
  }
}
