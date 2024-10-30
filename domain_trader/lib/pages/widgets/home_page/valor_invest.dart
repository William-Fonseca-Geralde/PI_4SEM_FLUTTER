import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class ValorInvest extends StatelessWidget {
  const ValorInvest({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card.outlined(
          margin: const EdgeInsets.symmetric(vertical: paddingPadrao),
          color: corSecundaria,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height / 7,
            child: Padding(
              padding: const EdgeInsets.all(paddingPadrao),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'R\$ Valor',
                        style: TextStyle(
                          fontSize: 24
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/my_domains');
                        },
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(const Size(35, 35)),
                          padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
                        ),
                        child: const Text(
                          'Meus domínios',
                          style: TextStyle(
                            fontSize: 10
                          ),
                        )
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