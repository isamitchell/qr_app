import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanFloatingButtom extends StatelessWidget {
  const ScanFloatingButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        String barcodeScanRes = 'https://www.google.com';
        print('Hola scan_Buttom $barcodeScanRes');
      },
      elevation: 0,
      child: Icon(Icons.qr_code_scanner),
    );
  }
}
