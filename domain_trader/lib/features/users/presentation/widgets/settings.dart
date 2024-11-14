import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/users/presentation/widgets/help.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _helpBottonSheets() {
    showModalBottomSheet(
      context: context, 
      builder: (context) => const Help(),
    );
  }

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
              Navigator.of(context).pushNamed('/settings/customization');
            },
          ),
          const Divider(height: 0),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.help)),
            title: const Text('Ajuda'),
            onTap: () {
              _helpBottonSheets();
            },
          )
        ],
      ),
    );
  }
}