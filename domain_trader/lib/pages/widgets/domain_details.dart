import 'package:flutter/material.dart';

class DomainDetails extends StatelessWidget {
  final String domain;

  const DomainDetails({
    super.key,
    required this.domain,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Detalhes do Leilão'),
      content: Text(domain),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Fechar')
        )
      ],
    );
  }
}