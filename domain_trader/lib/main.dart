import 'package:domain_trader/features/core/constants/constants.dart';
import 'package:domain_trader/features/core/providers/app_provider.dart';
import 'package:domain_trader/features/users/presentation/pages/create_account_page.dart';
import 'package:domain_trader/features/domains_lists/presentation/pages/home_page.dart';
import 'package:domain_trader/intro_page.dart';
import 'package:domain_trader/features/users/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://fntxaopjlqjlclcyldbm.supabase.co/rest/v1/',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHhhb3BqbHFqbGNsY3lsZGJtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzAwODY3NDYsImV4cCI6MjA0NTY2Mjc0Nn0.RY50bSZK2VIJI454bMx3YnTohQXbgA73lj7g1x7lhNY',
  );
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