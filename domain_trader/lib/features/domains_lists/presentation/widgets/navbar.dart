import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(paddingPadrao),
          child: SizedBox(
            width: 45,
            height: 45,
            child: Image.asset(logo),
          ),
        ),
        const Text(
          'Domain Trader',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}