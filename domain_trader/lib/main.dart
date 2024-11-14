import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/users/presentation/pages/create_account_page.dart';
import 'package:domain_trader/features/domains_lists/presentation/pages/home_page.dart';
import 'package:domain_trader/features/users/presentation/pages/customization_page.dart';
import 'package:domain_trader/intro_page.dart';
import 'package:domain_trader/features/users/presentation/pages/login_page.dart';
import 'package:domain_trader/features/users/presentation/pages/settings_user_page.dart';
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
        '/settings': (_) => const SettingsPage(),
        '/settings/customization': (_) => const CustomizationPage(),
      },
    );
  }
}