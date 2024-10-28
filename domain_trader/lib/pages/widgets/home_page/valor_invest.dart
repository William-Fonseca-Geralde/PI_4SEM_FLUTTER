import 'package:flutter/material.dart';

class ValorInvest extends StatelessWidget {
  const ValorInvest({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card.outlined(
          margin: const EdgeInsets.all(20),
          color: Colors.blueGrey,
          child: SizedBox(
            width: 450,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Valor',
                        style: TextStyle(
                          fontSize: 24
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FilledButton.tonal(
                        onPressed: () {},
                        child: const Text('Meus domínios')
                      ),
                    ],
                  )
                ],
              ),
            )
          ),
        ),
      ],
    );
  }
}