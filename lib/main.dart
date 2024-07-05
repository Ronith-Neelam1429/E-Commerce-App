import 'package:e_commerce/auth/login_or_register.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:e_commerce/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // Theme Provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      // Shop Provider
      ChangeNotifierProvider(create: (context) => Shop()),
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
      home: LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
