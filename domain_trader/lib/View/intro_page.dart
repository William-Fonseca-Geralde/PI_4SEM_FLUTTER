import 'package:domain_trader/View/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ),
            Text(
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