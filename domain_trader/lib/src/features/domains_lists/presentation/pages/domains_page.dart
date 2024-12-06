import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/list_domains.dart';
import 'package:flutter/material.dart';

class DomainsPage extends StatefulWidget {
  const DomainsPage({super.key});

  @override
  State<DomainsPage> createState() => _DomainsPageState();
}

class _DomainsPageState extends State<DomainsPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        flex: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Leilões',
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Lista de Leilões',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const ListDomains(selectedOption: 'leiloes'),
                  ],
                ),
                const SizedBox(width: paddingPadrao * 3),
                Column(
                  children: [
                    Text(
                      'Minha Lista',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const ListDomains(selectedOption: 'investimento'),
                  ],
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}