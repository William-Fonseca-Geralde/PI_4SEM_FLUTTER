import 'package:domain_trader/src/dialog_alert.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/domains_lists/data/repositories/domain_repository_impl.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanceDialog extends ConsumerStatefulWidget {
  const LanceDialog({super.key});

  @override
  ConsumerState<LanceDialog> createState() => _LanceDialogState();
}

class _LanceDialogState extends ConsumerState<LanceDialog> {
  final _priceController = TextEditingController();

  Future<List<Map<String, dynamic>>> _dominios() async {
    final domainRepository = DomainRepositoryImpl(supabase: ref.read(supabaseProvider));

    final domains = await domainRepository.findAllDomains();

    return domains;
  }

  @override
  Widget build(BuildContext context) {
    final dominios = _dominios();

    return DialogAlert(
      title: 'Valor do Lance',
      content: InputText(
        controller: _priceController,
        prefixIcon: const Icon(Icons.attach_money),
        hintText: 'R\$ Valor Mínino',
        typeText: 'price', 
        labelText: 'Valor a Investir'
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar')
        ),
        FilledButton(
          onPressed: () {
            
          },
          child: const Text('Dar Lance')
        ),
      ]
    );
  }
}