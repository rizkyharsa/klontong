import 'package:flutter/material.dart';
import 'package:klontong/navigation_menu.dart';
import 'package:klontong/providers/navigation_provider.dart';
import 'package:klontong/providers/product_provider.dart';
import 'package:klontong/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => NavigationProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Klontong Store',
      themeMode: ThemeMode.system,
      theme: AppTheme.klontongTheme,
      home: const NavigationMenu(),
    );
  }
}
