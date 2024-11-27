import 'package:domain_trader/src/dialog_alert.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/leiloes/data/models/leilao_model.dart';
import 'package:domain_trader/src/features/leiloes/data/repositories/leiloes_repository_impl.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LanceDialog extends ConsumerStatefulWidget {
  const LanceDialog(this.domain, {super.key});

  final String domain;

  @override
  ConsumerState<LanceDialog> createState() => _LanceDialogState();
}

class _LanceDialogState extends ConsumerState<LanceDialog> {
  final _priceController = TextEditingController();
  Map<String, dynamic>? leilao; 

  Future<void> _criarLeilao() async {
    final leilaoRepository = LeiloesRepositoryImpl(supabase: ref.read(supabaseProvider));
    final User? user = ref.read(supabaseProvider).auth.currentUser;

    if (user != null) {
      final usuario = await ref.read(supabaseProvider)
        .from('usuario')
        .select()
        .eq('supabase_id', user.id)
        .single();

      final dominio = await ref.read(supabaseProvider)
        .from('dominio')
        .select()
        .eq('url', widget.domain)
        .single();
      
      final valor = _priceController.text.replaceAll(RegExp(r'[^\d.]'), '');
      
      final leilao = LeilaoModel(
        id_dominio: dominio['id_dominio'], 
        id_usuario: usuario['id_usuario'],
        valor: double.parse(valor),
      );

      await leilaoRepository.createLeilao(leilao);

      if (mounted) {
        Navigator.of(context).pushNamed('/home');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lance na ${widget.domain} foi feito')),
        );
      }
    }
  }

  Future<void> _checarLeilao() async {
    final User? user = ref.read(supabaseProvider).auth.currentUser;

    if (user != null) {
      final usuario = await ref.read(supabaseProvider)
        .from('usuario')
        .select()
        .eq('supabase_id', user.id)
        .single();

      final dominio = await ref.read(supabaseProvider)
        .from('dominio')
        .select()
        .eq('url', widget.domain)
        .single();
      
      final data = await ref.read(supabaseProvider)
        .from('leilao')
        .select()
        .eq('id_usuario', usuario['id_usuario'])
        .eq('id_dominio', dominio['id_dominio']);

      if (data.isNotEmpty) {
        setState(() {
          leilao = data.first;
        });
      }
    }
  }

  Future<void> _atualizarLeilao() async {
    final User? user = ref.read(supabaseProvider).auth.currentUser;
    final leilaoRepository = LeiloesRepositoryImpl(supabase: ref.read(supabaseProvider));

    if (user != null) {
      final valor = _priceController.text.replaceAll(RegExp(r'[^\d.]'), '');

      await leilaoRepository.updateLeilao(valor, user, widget.domain);

      if (mounted) {
        Navigator.of(context).pushNamed('/home');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lance na ${widget.domain} atualizado!!!')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checarLeilao();
  }

  @override
  Widget build(BuildContext context) {
    return DialogAlert(
      title: 'Valor do Lance',
      content: InputText(
        controller: _priceController,
        prefixIcon: const Icon(Icons.attach_money),
        hintText: 'R\$ 00.00',
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
        leilao == null
        ? FilledButton(
          onPressed: () {
            _criarLeilao();
          },
          child: const Text('Dar Lance')
        )
        : FilledButton(
          onPressed: () {
            _atualizarLeilao();
          },
          child: const Text('Aumentar o Lance')
        )
      ]
    );
  }
}