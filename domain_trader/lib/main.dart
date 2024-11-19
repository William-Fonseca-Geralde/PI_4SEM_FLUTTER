import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/core/providers/app_provider.dart';
import 'package:domain_trader/features/users/presentation/pages/create_account_page.dart';
import 'package:domain_trader/features/domains_lists/presentation/pages/home_page.dart';
import 'package:domain_trader/intro_page.dart';
import 'package:domain_trader/features/users/presentation/pages/login_page.dart';
import 'package:domain_trader/utils/navigation_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final isLightTheme = MediaQuery.platformBrightnessOf(context) == Brightness.light;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(brightnessProvider.notifier).state = isLightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = ref.watch(brightnessProvider);

    return MaterialApp(
      navigatorObservers: [navigatorObserver],
      debugShowCheckedModeBanner: false,
      theme: isLightTheme
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