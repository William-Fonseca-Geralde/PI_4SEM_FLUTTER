import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class LanceDialog extends StatefulWidget {
  const LanceDialog({super.key});

  @override
  State<LanceDialog> createState() => _LanceDialogState();
}

class _LanceDialogState extends State<LanceDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Valor do Lance'),
      content: TextField(
        inputFormatters: [
          CurrencyInputFormatter(
            leadingSymbol: 'R\$',
            useSymbolPadding: true
          )
        ],
        decoration: const InputDecoration(
          hintText: 'R\$ Valor Mínimo'
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () {
            
          },
          child: const Text('Dar Lance')
        ),
        OutlinedButton(
          onPressed: () {
            
          },
          child: const Text('Cancelar')
        )
      ],
    );
  }
}