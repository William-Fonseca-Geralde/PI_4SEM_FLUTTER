import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingPadrao),
          child: SizedBox(
            width: 45,
            height: 45,
            child: Image.asset(logo),
          ),
        ),
        Text(
          'Domain Trader',
          style: Theme.of(context).textTheme.titleMedium
        ),
      ],
    );
  }
}