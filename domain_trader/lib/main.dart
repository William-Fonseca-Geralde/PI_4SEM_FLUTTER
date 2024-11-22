import 'package:domain_trader/src/app.dart';
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