import 'package:flutter/material.dart';

class ValorInvest extends StatelessWidget {
  const ValorInvest({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card.outlined(
          margin: const EdgeInsets.symmetric(vertical: 16),
          color: Colors.blueGrey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height / 9,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Valor',
                        style: TextStyle(
                          fontSize: 28
                        ),
                      ),
                      FilledButton.tonal(
                        onPressed: () {},
                        child: const Text('Meus domínios')
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