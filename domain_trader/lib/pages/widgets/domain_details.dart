import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class DomainDetails extends StatelessWidget {
  final String domain;

  const DomainDetails({
    super.key,
    required this.domain,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      widthFactor: 1,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(paddingPadrao),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Detalhes do Leilão',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(paddingPadrao),
                child: Container(
                  height: 100,
                  color: Colors.grey,
                  child: const Text('gráfico'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}