import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDomain extends StatefulWidget {
  const AddDomain({super.key});

  @override
  State<AddDomain> createState() => _AddDomainState();
}

class _AddDomainState extends State<AddDomain> {
  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Novo Domínio'),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Salvar')
            ),
          ],
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(paddingPadrao),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputText(prefixIcon: Icon(CupertinoIcons.globe), hintText: 'Ex: www.teste.com', typeText: 'domain', labelText: 'Domínio'),
                SizedBox(height: paddingPadrao),
                DropdownMenu(
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 'tecnol', label: 'Tecnologia'),
                    DropdownMenuEntry(value: 'nature', label: 'Natureza'),
                    DropdownMenuEntry(value: 'comerc', label: 'Comércio'),
                    DropdownMenuEntry(value: 'aprese', label: 'Apresentação'),
                    DropdownMenuEntry(value: 'viagem', label: 'Viagem'),
                  ]
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    
                  ],
                )
              ],
            ),
          )
        ),
      )
    );
  }
}