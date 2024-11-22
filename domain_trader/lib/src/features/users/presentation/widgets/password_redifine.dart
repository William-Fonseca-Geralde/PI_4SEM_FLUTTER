import 'package:domain_trader/src/dialog_alert.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_password.dart';
import 'package:flutter/material.dart';

class PasswordRedifine extends StatelessWidget {
  const PasswordRedifine({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogAlert(
      title: 'Redefinição de Senha',
      content:SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/4,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InputPassword(hintText: '', labelText: 'Senha'),
            InputPassword(hintText: '', labelText: 'Digite novamente')
          ],
        ),
      ), 
      actions: [
        FilledButton(
          onPressed: () {
            
          },
          child: const Text('Confirmar')
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar')
        ),
      ]
    );
  }
}