import 'package:domain_trader/src/dialog_full.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
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
        Form(
          child: Column(
            children: [
              Text(
                'Digite nos campos que deseja atualizar os dados',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              InputText(prefixIcon: const Icon(Icons.person), hintText: 'Jorge Amado', typeText: 'nome', labelText: 'Nome do usuário'),
              InputText(prefixIcon: const Icon(Icons.email_rounded), hintText: 'jorge.amado@gmail.com', typeText: 'email', labelText: 'E-mail'),
              InputText(prefixIcon: const Icon(Icons.phone), hintText: '+55 (19) 97524-5417', typeText: 'tell', labelText: 'Telefone',),
            ],
          ),
        ),
      ]
    );
  }
}