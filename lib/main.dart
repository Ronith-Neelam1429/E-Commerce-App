import 'package:e_commerce/firebase/auth/authGate.dart';
import 'package:e_commerce/firebase/auth/login_or_register.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:e_commerce/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        // Theme Provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // Shop Provider
        ChangeNotifierProvider(create: (context) => Shop()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
