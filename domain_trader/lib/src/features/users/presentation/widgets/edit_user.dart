import 'package:domain_trader/src/dialog_full.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/confirm_email.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/material.dart';

class EditUser extends StatelessWidget {
  const EditUser({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogFull(
      nomeDialog: 'Edição do Usuário',
      image: logo_login,
      forms: [
        const InputText(prefixIcon: Icon(Icons.person), hintText: 'Jorge Amado', typeText: 'nome', labelText: 'Nome do usuário'),
        const InputText(prefixIcon: Icon(Icons.email_rounded), hintText: 'jorge.amado@gmail.com', typeText: 'email', labelText: 'E-mail'),
        const InputText(prefixIcon: Icon(Icons.phone), hintText: '+55 (19) 97524-5417', typeText: 'tell', labelText: 'Telefone',),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(paddingPadrao),
            child: FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const ConfirmEmail(),
                );
              },
              child: const Text('Redefinir a Senha'),
            ),
          ),
        ),
      ]
    );
  }
}