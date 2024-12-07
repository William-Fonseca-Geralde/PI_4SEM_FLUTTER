import 'package:domain_trader/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://wndujxjoqvuvwqwtpywh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InduZHVqeGpvcXZ1dndxd3RweXdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIzNzAwNDYsImV4cCI6MjA0Nzk0NjA0Nn0.ArIclVv0Pvks4lpNWP_bSNepF1GMfWcnIB-zML9EELE',
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}