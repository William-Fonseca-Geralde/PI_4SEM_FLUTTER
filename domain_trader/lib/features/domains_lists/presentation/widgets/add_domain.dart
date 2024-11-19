import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/category_input.dart';
import 'package:domain_trader/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDomain extends StatefulWidget {
  const AddDomain({super.key});

  @override
  State<AddDomain> createState() => _AddDomainState();
}

class _AddDomainState extends State<AddDomain> {
  final List<DropdownMenuEntry> listaCategory = [
    const DropdownMenuEntry(value: 'tecnol', label: 'Tecnologia'),
    const DropdownMenuEntry(value: 'nature', label: 'Natureza'),
    const DropdownMenuEntry(value: 'comerc', label: 'Comércio'),
    const DropdownMenuEntry(value: 'aprese', label: 'Apresentação'),
    const DropdownMenuEntry(value: 'viagem', label: 'Viagem'),
  ];

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(paddingPadrao),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const InputText(prefixIcon: Icon(CupertinoIcons.globe), hintText: 'Ex: www.teste.com', typeText: 'domain', labelText: 'Domínio'),
                const SizedBox(height: paddingPadrao),
                CategoryInput(dropdownMenuEntries: listaCategory),
                const Row(
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