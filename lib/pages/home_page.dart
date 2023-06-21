import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/pages/history_direc.dart';
import 'package:qr_app/pages/history_mapas.dart';
import 'package:qr_app/providers/ui_provider.dart';
import 'package:qr_app/widges/navigation_bar.dart';
import 'package:qr_app/widges/scan_buttom.dart';

import '../providers/isar_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Historial'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.delete))],
      ),
      body: const _HomeBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanFloatingButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    // Obtener el selectedMenuOpt

    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar Para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO temporal leer la base de datos
    IsarProvider.db.dataBase;
    //DBProvider.db.getScanById(1).then((scan) => print(scan!.valor));

    switch (currentIndex) {
      case 0:
        return const HistoryMaps();

      case 1:
        return const HistoryAdress();

      default:
        return const HistoryMaps();
    }
  }
}
