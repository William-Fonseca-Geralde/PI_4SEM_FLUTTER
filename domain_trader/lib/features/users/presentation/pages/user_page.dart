import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Perfil',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            Card.filled(
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
            ),
            Card.filled(
              margin: EdgeInsets.all(paddingPadrao),
              child: Column(
                children: <Widget> [
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.settings)),
                    title: const Text('Configurações'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/settings');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}