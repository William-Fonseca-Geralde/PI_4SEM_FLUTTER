import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/domain_details.dart';
import 'package:flutter/material.dart';

class ListDomains extends StatelessWidget {
  final String selectedOption;

  const ListDomains({super.key, required this.selectedOption});

  void _showDomainDetails(BuildContext context, String domain) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DomainDetails(domain: domain);
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, List<String>> _dados = {
      'leiloes': ['www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com', 'www.leiloes.com'
      ],
      'investimento': ['www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com', 'www.invest.com'
      ],
      'mydomains': ['www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com', 'www.mydomains.com'
      ]
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
                      itemCount: _dados[selectedOption]?.length ?? 0,
                      itemBuilder: (context, index) {
                        final item = _dados[selectedOption]?[index] ?? '';
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                item,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              onTap: () {
                                _showDomainDetails(context, _dados[selectedOption]?[index] ?? '');
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