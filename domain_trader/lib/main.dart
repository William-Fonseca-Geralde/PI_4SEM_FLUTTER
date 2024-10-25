import 'package:domain_trader/View/home_page.dart';
import 'package:domain_trader/View/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const IntroPage(),
        '/home': (_) => const HomePage(),
      },
    );
  }
}