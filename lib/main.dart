import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/pages/home_page.dart';
import 'package:qr_app/pages/mapa_page.dart';
import 'package:qr_app/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider (create: (context) => UiProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeScreen(),
          'maps': (context) => const MapaScreen(),
        },
        theme: ThemeData(
          primaryColor: Colors.teal,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.teal),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(selectedItemColor: Colors.teal)
        ),
      ),
    );
  }
}