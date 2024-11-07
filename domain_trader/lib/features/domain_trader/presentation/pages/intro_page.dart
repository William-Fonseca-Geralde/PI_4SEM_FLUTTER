import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    loadData();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500)
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
    );
  }

  void loadData() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushNamed('/home');
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Image.asset(
                logo,
                width: 250,
                height: 250,
              )
            ),
            const Text(
              'Bem-Vindo ao DomainTrader',
              style: TextStyle(
                fontSize: 24,
              ),
            )
          ],
        ),
      )
    );
  }
}