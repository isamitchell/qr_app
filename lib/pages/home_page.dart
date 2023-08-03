import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/pages/history_direc.dart';
import 'package:qr_app/pages/history_mapas.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/providers/ui_provider.dart';
import 'package:qr_app/widges/navigation_bar.dart';
import 'package:qr_app/widges/scan_buttom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteScans();
              },
              icon: const Icon(Icons.delete))
        ],
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

    // Usar el ScanListProvider, para acceder a los valores
    //Listen van en false para que no se redibuje la nstancia
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const HistoryMaps();

      case 1:
        scanListProvider.loadScansByType('http');
        return const HistoryAdress();

      default:
        return const HistoryMaps(); // todo: modificar default por una pagina defecto
    }
  }
}
