import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin:const EdgeInsets.all(paddingPadrao),
      child: Column(
        children: <Widget> [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.settings)),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          const Divider(height: 0),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.notifications)),
            title: const Text('Personalização'),
            onTap: () {
              
            },
          ),
          const Divider(height: 0),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.help)),
            title: const Text('Ajuda'),
            onTap: () {
              
            },
          )
        ],
      ),
    );
  }
}