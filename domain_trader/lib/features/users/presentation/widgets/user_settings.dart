import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
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
            const Padding(
              padding: EdgeInsets.all(paddingPadrao),
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person),
              ),
            ),
            Text(
              'Nome do Usuário',
              style: Theme.of(context).textTheme.bodyLarge
            ),
            const SizedBox(
              height: paddingPadrao,
            ),
            FilledButton(
              onPressed: () {
                            
              },
              child: const Text('Editar Conta')
            ),
            const SizedBox(
              height: paddingPadrao,
            ),
            FilledButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red)
              ),
              onPressed: () {
              
              },
              child: const Text('Sair da Conta')
            ),
            const SizedBox(
              height: paddingPadrao,
            ),
            Card.filled(
              child: Padding(
                padding: const EdgeInsets.all(paddingPadrao),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Tema: ',
                      style: Theme.of(context).textTheme.bodyLarge
                    ),
                    Icon(Icons.light_mode)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}