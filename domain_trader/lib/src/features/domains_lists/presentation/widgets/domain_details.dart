import 'package:domain_trader/src/dialog_alert.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/domains_lists/data/repositories/domain_repository_impl.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/lance_dialog.dart';
import 'package:domain_trader/src/features/leiloes/data/repositories/leiloes_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  int? userId, userIdDomain;
  List<Map<String, dynamic>>? dominios, dados;

  Future<void> _checarUsuario() async {
    final User? user = ref.read(supabaseProvider).auth.currentUser;

    if (user != null) {
      final data = await ref.read(supabaseProvider)
      .from('usuario')
      .select()
      .eq('supabase_id', user.id)
      .single();

      setState(() {
        userId = data['id_usuario'];
      });
    }
  }

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
        userIdDomain = result['id_usuario'];
      });
    }
  }

  Future<void> _verifInvest() async {
    final User? user = ref.read(supabaseProvider).auth.currentUser;
    final domainRepository = DomainRepositoryImpl(supabase: ref.read(supabaseProvider));
    final data = await domainRepository.findDomainsbyInvest(user);

    if (mounted) {
      setState(() {
        dados = data;
      }); 
    }
  }

  Future<void> _idDomain() async {
    final leiloesRepository = LeiloesRepositoryImpl(supabase: ref.read(supabaseProvider));

    final data = await ref.read(supabaseProvider).from('dominio').select().eq('url', widget.domain).single();
    final dominioId = data['id_dominio'];
    final leiloes = await leiloesRepository.findLeiloesbyDomain(dominioId);

    if (mounted) {
      setState(() {
        dominios = leiloes;
      });
    }
  }

  Future<void> _desfazerAposta() async {
    final User? user = ref.read(supabaseProvider).auth.currentUser;
    final leiloesRepository = LeiloesRepositoryImpl(supabase: ref.read(supabaseProvider));

    if (user != null) {
      await leiloesRepository.deleteLeilao(user, widget.domain);

      if (mounted) {
        Navigator.of(context).pushNamed('/home');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _verifInvest();
    _dominios();
    _idDomain();
    _checarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = ref.read(supabaseProvider).auth.currentUser;
    final domainsNome = dados != null ? dados?.where((element) => element['url'] == widget.domain).toList() : List.empty();

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 450,
        vertical: 100,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Detalhes do Leilão',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(paddingPadrao/4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.domain,
                  style: Theme.of(context).textTheme.headlineMedium
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(paddingPadrao),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card.outlined(
                            child: Padding(
                              padding: const EdgeInsets.all(paddingPadrao),
                              child: Column(
                                children: [
                                  if (nomeDono == null)
                                    const Center(child: CircularProgressIndicator.adaptive())
                                  else ... [
                                    const CircleAvatar(
                                      radius: 30,
                                      child: Icon(Icons.person),
                                    ),
                                    const SizedBox(height: paddingPadrao),
                                    Text('$nomeDono'),
                                  ]
                                ],
                              ),
                            ),
                          ),
                          if (userId != userIdDomain)...[
                            const SizedBox(height: paddingPadrao),
                            FilledButton(
                              onPressed: () {
                                showDialog(
                                  context: context, 
                                  builder: (BuildContext context) => LanceDialog(widget.domain)
                                );
                              },
                              child: domainsNome == null || domainsNome.isEmpty ? const Text('Dar Lance') : const Text('Aumentar o Lance')
                            ),
                            const SizedBox(height: paddingPadrao),
                            domainsNome == null || domainsNome.isEmpty
                            ? const FilledButton.tonal(
                              onPressed: null,
                              child: Text('Desfazer aposta')
                            )
                            : FilledButton.tonal(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DialogAlert(
                                      title: 'Desfazer Aposta', 
                                      content: const Text('Tem certeza de que deseja desfazer a aposta?'), 
                                      actions: [
                                        OutlinedButton(
                                          onPressed: () {
                                            _desfazerAposta();
                                          },
                                          child: const Text('Desfazer mesmo assim')
                                        ),
                                        const SizedBox(height: paddingPadrao),
                                        FilledButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Não desfazer')
                                        )
                                      ]
                                    );
                                  },
                                );
                              }, 
                              child: const Text('Desfazer aposta')
                            )
                          ]
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: paddingPadrao),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card.filled(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height / 2.5,
                                    width: MediaQuery.of(context).size.width / 5,
                                    child: dominios == null
                                    ? const Center(child: CircularProgressIndicator.adaptive())
                                    : dominios!.isNotEmpty
                                      ? ListView.builder(
                                        itemCount: dominios!.length,
                                        itemBuilder: (context, index) {
                                          final item = dominios?[index];
                                      
                                          return Column(
                                            children: [
                                              ListTile(
                                                title: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      item?['nome'],
                                                      style: Theme.of(context).textTheme.bodySmall,
                                                    ),
                                                    Text(
                                                      'R\$ ${item?['valor'].toString()}',
                                                      style: Theme.of(context).textTheme.bodySmall,
                                                    )
                                                  ],
                                                ),
                                                leading: item?['id'] == user?.id ? const Icon(Icons.star) : null,
                                              ),
                                              const Divider(height: 0)
                                            ],
                                          );
                                        },
                                      ) 
                                      : const Center(child: Text('Não há participantes'))
                                  )
                                ],
                              ),
                            ),
                          )
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
    );
  }
}