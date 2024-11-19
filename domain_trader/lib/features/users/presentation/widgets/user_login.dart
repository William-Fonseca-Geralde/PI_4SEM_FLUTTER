import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: const EdgeInsets.all(paddingPadrao),
      child: Padding(
        padding: const EdgeInsets.all(paddingPadrao),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Você Ainda não tem uma conta ou não está cadastrado.\n\nClique em: ',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: paddingPadrao),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cadastro');
              },
              child: const Text('Cadastrar'),
            ),
            const SizedBox(height: paddingPadrao),
            const Text('ou'),
            const SizedBox(height: paddingPadrao),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}