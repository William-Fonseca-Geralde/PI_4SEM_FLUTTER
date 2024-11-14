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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              color: corFundo,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ValorInvest(),
                  OpcoesDomains(),
                  ListDomains(),
                ],
              )
            ),
          )
        ],
      )
    );
  }
}