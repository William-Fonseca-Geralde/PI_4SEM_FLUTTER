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
            const SizedBox(
              width: 150,
              height: 150,
              child: Icon(Icons.person),
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
            FilledButton.tonal(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.redAccent)
              ),
              onPressed: () {
                
              },
              child: const Text('Deletar Conta')
            )
          ],
        ),
      ),
    );
  }
}