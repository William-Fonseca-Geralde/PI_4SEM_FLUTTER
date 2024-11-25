import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/app_provider.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/domains_lists/data/models/domain_model.dart';
import 'package:domain_trader/src/features/domains_lists/data/repositories/domain_repository_impl.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/domain_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListDomains extends ConsumerStatefulWidget {
  final String selectedOption;

  const ListDomains({super.key, required this.selectedOption});

  @override
  ConsumerState<ListDomains> createState() => _ListDomainsState();
}

class _ListDomainsState extends ConsumerState<ListDomains> {
  List<DomainModel>? dominios;

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

  @override
  void initState() {
    super.initState();
    _dominios();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<DomainModel>?> _dados = {
      'leiloes': dominios,
    };

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
                    child: ListView.builder(
                      itemCount: _dados['leiloes']?.length,
                      itemBuilder: (context, index) {
                        final item = _dados['leiloes'];

                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                item?[index].url ?? '',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              onTap: () {
                                _showDomainDetails(context, item![index].url);
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