import 'package:domain_trader/src/dialog_full.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/domains_lists/data/models/domain_model.dart';
import 'package:domain_trader/src/features/domains_lists/data/repositories/domain_repository_impl.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/category_input.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/daterange_input.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/status_input.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddDomainPage extends ConsumerStatefulWidget {
  const AddDomainPage({super.key});

  @override
  ConsumerState<AddDomainPage> createState() => _AddDomainPageState();
}

class _AddDomainPageState extends ConsumerState<AddDomainPage> {
  final _formKey = GlobalKey<FormState>();
  final _domainController = TextEditingController();
  final _priceController = TextEditingController();
  final _dateController = TextEditingController();
  final _categoryController = TextEditingController();

  final List<DropdownMenuEntry> listaCategory = [
    const DropdownMenuEntry(value: 'tecnol', label: 'Tecnologia'),
    const DropdownMenuEntry(value: 'nature', label: 'Natureza'),
    const DropdownMenuEntry(value: 'comerc', label: 'Comércio'),
    const DropdownMenuEntry(value: 'aprese', label: 'Apresentação'),
    const DropdownMenuEntry(value: 'viagem', label: 'Viagem'),
  ];

  String? _selectedOption;

  @override
  void dispose() {
    super.dispose();
    _domainController.dispose();
    _priceController.dispose();
    _dateController.dispose();
    _categoryController.dispose();
  }

  Future<void> _criarDominio() async {
    if (_formKey.currentState?.validate() ?? false) {
      final User? user = ref.read(supabaseProvider).auth.currentUser;
      final domainRepository = DomainRepositoryImpl(supabase: ref.read(supabaseProvider));
      final usuario = await ref.read(supabaseProvider)
        .from('usuario')
        .select()
        .eq('supabase_id', user!.id)
        .single();

      try {
        final valor = _priceController.text.replaceAll(RegExp(r'[^\d.]'), '');
        final date = DateFormat('dd/MM/yyyy').parse(_dateController.text);

        final domain = DomainModel(
          url: _domainController.text, 
          idUser: usuario['id_usuario'], 
          preco: double.parse(valor),
          dataExpiracao: date.toUtc().toIso8601String(),
          status: _selectedOption ?? "", 
          categoria: _categoryController.text
        );

        await domainRepository.createDomain(domain);

        if (mounted) {
          Navigator.of(context).pop();
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao criar o domínio: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return DialogFull(
      formKey: _formKey,
      nomeDialog: 'Novo Domínio',
      image: logo_domain,
      forms: [
        Column(
          children: [
            InputText(
              controller: _domainController,
              prefixIcon: const Icon(CupertinoIcons.globe), 
              hintText: 'Ex: www.teste.com', 
              typeText: 'domain', 
              labelText: 'Domínio'
            ),
            DaterangeInput(controller: _dateController),
            InputText(
              controller: _priceController,
              prefixIcon: const Icon(Icons.attach_money),
              hintText: 'Ex: R\$ 99.99',
              typeText: 'price',
              labelText: 'Preço'
            ),
            StatusInput(
              status: const ['disponível', 'vendido', 'pausado'],
              onSelected: (value) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    _selectedOption = value;
                  });
                });
              },
            ),
            CategoryInput(
              dropdownMenuEntries: listaCategory,
              controller: _categoryController
            ),
          ],
        )
      ],
      floatingActionButton: () {
        _criarDominio();
      },
    );
  }
}