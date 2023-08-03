import 'package:flutter/material.dart';
import 'package:qr_app/pages/home_page.dart';
import 'package:qr_app/pages/mapa_page.dart';

import 'providers/providers.dart';

void main() async {
  runApp(const MyApp());
  IsarProvider.db.initDB();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UiProvider(),
        ),
        ChangeNotifierProvider(create: (context) => ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeScreen(),
          'mapa': (context) => const MapaScreen(),
        },
        theme: ThemeData(
            primaryColor: Colors.teal,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.teal),
            appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.teal)),
      ),
    );
  }
}
