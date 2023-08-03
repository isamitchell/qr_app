import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/scan_model_isar.dart';
import '../providers/providers.dart';

Future<void> launchUrlView(BuildContext context, ScanModel2 scan) async {
  Uri url = Uri.parse(scan.valor);
  if (scan.tipo == 'http') {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}

String latLong(String valor, int i) {
  final from = valor.indexOf('-');
  final to = valor.indexOf('?');

  final subCoord = valor.substring(from, to);
  final coord = subCoord.split(',')[i];

  return coord;
}
