import 'package:domain_trader/src/dialog_alert.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/material.dart';

class ConfirmEmail extends StatelessWidget {
  const ConfirmEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogAlert(
      title: 'Confirmação do E-mail',
      content:  SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/5,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Digite seu E-mail para prosseguir'),
            InputText(prefixIcon: Icon(Icons.email_rounded), hintText: 'Seu email', typeText: 'email', labelText: 'E-mail')
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar')
        ),
        FilledButton.icon(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/password_redefine');
          },
          label: const Text('Prosseguir'),
          icon: const Icon(Icons.arrow_forward),
        ),
      ]
    );
  }
}