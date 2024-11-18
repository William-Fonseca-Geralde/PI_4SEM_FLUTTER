import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/list_domains.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/opcoes_domains.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/valor_invest.dart';
import 'package:flutter/material.dart';

class DomainsPage extends StatefulWidget {
  const DomainsPage({super.key});

  @override
  State<DomainsPage> createState() => _DomainsPageState();
}

class _DomainsPageState extends State<DomainsPage> {
  static final Set<String> _opcoesDomains = {'leiloes', 'investimento'};
  Set<String> _opcoesDomainsSegmented = {_opcoesDomains.first};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              color: corFundo,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ValorInvest(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: SegmentedButton(
                          showSelectedIcon: false,
                          segments: [
                            ButtonSegment(value: _opcoesDomains.elementAt(0), label: const Text('Leilões')),
                            ButtonSegment(value: _opcoesDomains.elementAt(1), label: const Text('Meus Investimentos'))
                          ],
                          selected: _opcoesDomainsSegmented,
                          onSelectionChanged: (opcao) {
                            setState(() {
                              _opcoesDomainsSegmented = opcao;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  ListDomains(selectedOption: _opcoesDomainsSegmented.first),
                ],
              )
            ),
          ),
        ],
      )
    );
  }
}