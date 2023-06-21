import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex, 
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Mapas'),
      BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration), label: 'Direcciones')
    ]);
  }
}
