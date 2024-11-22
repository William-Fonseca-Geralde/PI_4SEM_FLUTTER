import 'package:domain_trader/src/dialog_full.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/category_input.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/daterange_input.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/status_input.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDomainPage extends StatefulWidget {
  const AddDomainPage({super.key});

  @override
  State<AddDomainPage> createState() => _AddDomainPageState();
}

class _AddDomainPageState extends State<AddDomainPage> {
  final List<DropdownMenuEntry> listaCategory = [
    const DropdownMenuEntry(value: 'tecnol', label: 'Tecnologia'),
    const DropdownMenuEntry(value: 'nature', label: 'Natureza'),
    const DropdownMenuEntry(value: 'comerc', label: 'Comércio'),
    const DropdownMenuEntry(value: 'aprese', label: 'Apresentação'),
    const DropdownMenuEntry(value: 'viagem', label: 'Viagem'),
  ];

  @override
  Widget build(BuildContext context) {
    return DialogFull(
      nomeDialog: 'Novo Domínio',
      image: logo_domain,
      forms: [
        Form(
          child: Column(
            children: [
              const InputText(prefixIcon: Icon(CupertinoIcons.globe), hintText: 'Ex: www.teste.com', typeText: 'domain', labelText: 'Domínio'),
              const DaterangeInput(),
              const InputText(prefixIcon: Icon(Icons.attach_money), hintText: 'Ex: R\$ 99.99', typeText: 'price', labelText: 'Preço'),
              const StatusInput(),
              CategoryInput(dropdownMenuEntries: listaCategory),
            ],
          ),
        )
      ]
    );
  }
}