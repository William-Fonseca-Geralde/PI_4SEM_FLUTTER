import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeApp extends ConsumerStatefulWidget {
  const ThemeApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ThemeAppState();
}

class _ThemeAppState extends ConsumerState<ThemeApp> {
  final GlobalKey _menuKey = GlobalKey();
  bool _isMenuOpen = false;
  bool _isPressed = false;
  bool _isHovered = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}