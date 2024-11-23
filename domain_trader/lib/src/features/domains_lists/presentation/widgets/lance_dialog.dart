import 'package:domain_trader/src/dialog_alert.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/material.dart';

class LanceDialog extends StatefulWidget {
  const LanceDialog({super.key});

  @override
  State<LanceDialog> createState() => _LanceDialogState();
}

class _LanceDialogState extends State<LanceDialog> {
  @override
  Widget build(BuildContext context) {
    return DialogAlert(
      title: 'Valor do Lance',
      content: InputText(prefixIcon: const Icon(Icons.attach_money), hintText: 'R\$ Valor Mínino', typeText: 'price', labelText: 'Valor a Investir'),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar')
        ),
        FilledButton(
          onPressed: () {
            
          },
          child: const Text('Dar Lance')
        ),
      ]
    );
  }
}