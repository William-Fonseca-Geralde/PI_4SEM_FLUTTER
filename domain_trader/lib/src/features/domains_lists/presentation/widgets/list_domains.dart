import 'package:domain_trader/src/dialog_alert.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/domains_lists/data/repositories/domain_repository_impl.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/pages/edit_domain_page.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/domain_details.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/user_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListDomains extends ConsumerStatefulWidget {
  final String selectedOption;

  const ListDomains({super.key, required this.selectedOption});

  @override
  ConsumerState<ListDomains> createState() => _ListDomainsState();
}

class _ListDomainsState extends ConsumerState<ListDomains> {
  List<Map<String, dynamic>>? dominios, dominiosInvest, dominiosUser;

  void _showDomainDetails(BuildContext context, String domain) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DomainDetails(domain: domain);
      }
    );
  }

  Future<void> _dominios() async {
    final domainRepository = DomainRepositoryImpl(supabase: ref.read(supabaseProvider));
    final domains = await domainRepository.findAllDomains();

    if (mounted) {
      setState(() {
        dominios = domains;
      });
    }
  }

  Future<void> _dominiosInvest() async {
    final User? user = ref.read(supabaseProvider).auth.currentUser;
    final domainRepository = DomainRepositoryImpl(supabase: ref.read(supabaseProvider));
    final domains = await domainRepository.findDomainsbyInvest(user);

    if (mounted) {
      setState(() {
        dominiosInvest = domains;
      });
    }
  }

  Future<void> _dominiosUser() async {
    final User? user = ref.read(supabaseProvider).auth.currentUser;
    final domainRepository = DomainRepositoryImpl(supabase: ref.read(supabaseProvider));
    final domains = await domainRepository.findDomainsbyUser(user);

    if (mounted) {
      setState(() {
        dominiosUser = domains;
      });
    }
  }

  Future<void> _deletarDominio(String? url) async {
    final domainRepository = DomainRepositoryImpl(supabase: ref.read(supabaseProvider));

    if (url != null) {
      await domainRepository.deleteDomain(url);

      if (mounted) {
        Navigator.of(context).pushNamed('/home');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Domínio $url deletado')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _dominios();
    _dominiosInvest();
    _dominiosUser();
  }

  @override
  Widget build(BuildContext context) {
    final List? _dados;

    if (widget.selectedOption == 'leiloes') {
      _dados = dominios;
    } else if (widget.selectedOption == 'investimento') {
      _dados = dominiosInvest;
    } else {
      _dados = dominiosUser;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card.filled(
          margin: const EdgeInsets.symmetric(vertical: paddingPadrao),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: _dados == null
                    ? const Center(child: CircularProgressIndicator())
                    : _dados.isEmpty
                      ? widget.selectedOption == 'mydomains'
                        ? widget.selectedOption != 'investimento'
                          ? const Center(child: Text('Não tem domínios cadastrados.\nAproveite e cadastre o seu domínio', textAlign: TextAlign.center,))
                          : const Padding(
                            padding: EdgeInsets.all(paddingPadrao),
                            child: UserLogin(),
                          )
                        : const Center(child: Text('Você não está participando de um leilão.\nAproveite e participe de um na aba Leilões'))
                      : ListView.builder(
                        itemCount: _dados.length,
                        itemBuilder: (context, index) {
                          final item = _dados?[index];

                          return Column(
                            children: [
                              ListTile(
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item['url'],
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                        Text(
                                          'R\$ ${item['valor'].toString()}',
                                          style: Theme.of(context).textTheme.bodyLarge
                                        )
                                      ],
                                    ),
                                    if (widget.selectedOption == 'mydomains') const SizedBox(height: paddingPadrao/2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (widget.selectedOption == 'mydomains')...[
                                          Column(
                                            children: [
                                              Chip(
                                                label: Text(item['status']),
                                                padding: const EdgeInsets.all(paddingPadrao/10),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  OutlinedButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return DialogAlert(
                                                            title: 'Deletar Domínio',
                                                            content: const Text('Deseja realmente deletar o domínio.\nNão será recebido nada em troca, ainda tem certeza?'),
                                                            actions: [
                                                              OutlinedButton(
                                                                onPressed: () {
                                                                  _deletarDominio(item['url']);
                                                                },
                                                                child: const Text('Deletar mesmo assim')
                                                              ),
                                                              const SizedBox(height: paddingPadrao),
                                                              FilledButton(
                                                                onPressed: () {
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: const Text('Não deletar')
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    style: const ButtonStyle(
                                                      foregroundColor: WidgetStatePropertyAll(Colors.red)
                                                    ),
                                                    child: const Text('Deletar'),
                                                  ),
                                                  const SizedBox(width: paddingPadrao),
                                                  OutlinedButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) => EditDomainPage(item['url']),
                                                      );
                                                    },
                                                    child: const Text('Editar')
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ]
                                      ],
                                    )
                                  ],
                                ),
                                
                                onTap: () {
                                  _showDomainDetails(context, item['url']);
                                },
                              ),
                              const Divider(height: 0)
                            ],
                          );
                        },
                      ),
                  )
                ],
              ),
            )
          )
        )
      ],
    );
  }
}