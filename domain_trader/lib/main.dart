import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/core/providers/app_provider.dart';
import 'package:domain_trader/features/users/presentation/pages/create_account_page.dart';
import 'package:domain_trader/features/domains_lists/presentation/pages/home_page.dart';
import 'package:domain_trader/intro_page.dart';
import 'package:domain_trader/features/users/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(brightnessProvider)
      ? ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: corPrimaria,
      )
      : ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: corPrimaria,
      ),
      routes: {
        '/': (context) => const IntroPage(),
        '/home': (_) => const HomePage(),
        '/cadastro': (_) => const CreateAccountPage(),
        '/login': (_) => const LoginPage(),
      },
    );
  }
}