import 'package:domain_trader/src/dialog_alert.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
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
        height: MediaQuery.of(context).size.height/2,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Digite a nova senha'),
            InputPassword(hintText: '', labelText: 'Nova Senha', helpText: 'A senha deve conter:\n - no mínimo 8 caracteres;\n - no mínimo 1 caracter especial (@ , - , _ , #);\n - ter números e letras;\n - ter letra maiúscula e minúscula.'),
            SizedBox(height: paddingPadrao),
            Text('Digite ela novamente'),
            InputPassword(hintText: '', labelText: 'Nova Senha', helpText: 'A senha ter que ser igual acima')
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
        FilledButton(
          onPressed: () {
            
          },
          child: const Text('Confirmar')
        ),
      ]
    );
  }
}