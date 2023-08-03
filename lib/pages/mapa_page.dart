import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_app/models/scan_model_isar.dart';
import 'package:qr_app/utils/utils.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({super.key});

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)?.settings.arguments as ScanModel2;
    final scanUrl = scan.valor;
    final lat = double.parse(latLong(scanUrl, 0));
    final long = double.parse(latLong(scanUrl, 1));
    final CameraPosition initialPoint = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746, // todo: agregar datos de url extraida
    );
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: initialPoint,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        print(lat + long);
      },
    ));
  }
}
