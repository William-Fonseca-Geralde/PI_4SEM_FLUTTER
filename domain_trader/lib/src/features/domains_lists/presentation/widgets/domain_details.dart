import 'dart:ffi';

import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/domains_lists/data/models/domain_model.dart';
import 'package:domain_trader/src/features/domains_lists/data/repositories/domain_repository_impl.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/lance_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DomainDetails extends ConsumerStatefulWidget {
  final String domain;

  const DomainDetails({
    super.key,
    required this.domain,
  });

  @override
  ConsumerState<DomainDetails> createState() => _DomainDetailsState();
}

class _DomainDetailsState extends ConsumerState<DomainDetails> {
  double? valor;
  String? nomeDono;

  Future<void> _dominios() async {
    if (!mounted) return;

    final result = await ref.read(supabaseProvider)
      .from('dominio')
      .select()
      .eq('url', widget.domain)
      .single();

    if (!mounted) return;

    final user = await ref.read(supabaseProvider)
      .from('usuario')
      .select()
      .eq('id_usuario', result['id_usuario'])
      .single();

    if (!mounted) return;

    final preco = result['preco'];
    final nome = user['nome'];

    if (mounted) {
      setState(() {
        valor = preco;
        nomeDono = nome;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    _dominios();

    return Expanded(
      child: FractionallySizedBox(
        heightFactor: 0.55,
        widthFactor: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Detalhes do Leilão',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close)
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(paddingPadrao),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.domain,
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'R\$ $valor',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(paddingPadrao),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card.outlined(
                              child: Padding(
                                padding: EdgeInsets.all(paddingPadrao),
                                child: Column(
                                  children: [
                                    const CircleAvatar(
                                      radius: 30,
                                      child: Icon(Icons.person),
                                    ),
                                    const SizedBox(height: paddingPadrao),
                                    Text('$nomeDono'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: paddingPadrao),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FilledButton(
                              onPressed: () {
                                showDialog(
                                  context: context, 
                                  builder: (BuildContext context) => const LanceDialog()
                                );
                              }, 
                              child: const Text('Dar Lance')
                            ),
                            const SizedBox(height: paddingPadrao),
                            const FilledButton.tonal(
                              onPressed: null,
                              child: Text('Desfazer aposta')
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}