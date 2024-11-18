import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class ValorInvest extends StatelessWidget {
  const ValorInvest({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card.filled(
          margin: const EdgeInsets.symmetric(vertical: paddingPadrao),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height / 10,
            child: Padding(
              padding: const EdgeInsets.all(paddingPadrao),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'R\$ Valor',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ),
        ),
      ],
    );
  }
}