import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/login_create/presentation/pages/create_account_page.dart';
import 'package:domain_trader/features/principal/presentation/pages/home_page.dart';
import 'package:domain_trader/features/principal/presentation/pages/intro_page.dart';
import 'package:domain_trader/features/login_create/presentation/pages/login_page.dart';
import 'package:domain_trader/features/my_domain/presentation/pages/my_domains_page.dart';
import 'package:domain_trader/features/settings_users/presentation/pages/settings_user_page.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: corPrimaria,
        )
      ),
      routes: {
        '/': (context) => const IntroPage(),
        '/home': (_) => const HomePage(),
        '/cadastro': (_) => const CreateAccountPage(),
        '/login': (_) => const LoginPage(),
        '/my_domains': (_) => const MyDomainsPage(),
        '/settings': (_) => const SettingsPage(),
      },
    );
  }
}