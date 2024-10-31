import 'package:domain_trader/constants.dart';
import 'package:domain_trader/pages/widgets/login_create_pages/input_text.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(paddingPadrao),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Configurações do Usuário',
                style: Theme.of(context).textTheme.titleLarge
              ),
              const InputText(prefixIcon: Icon(Icons.person), hintText: 'Nome do usuário')
            ],
          ),
        ),
      ),
    );
  }
}