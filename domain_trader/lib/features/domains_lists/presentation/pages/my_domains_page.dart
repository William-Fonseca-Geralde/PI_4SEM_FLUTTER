import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/list_domains.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/valor_my_domains.dart';
import 'package:flutter/material.dart';

class MyDomainsPage extends StatefulWidget {
  const MyDomainsPage({super.key});

  @override
  State<MyDomainsPage> createState() => _MyDomainsPageState();
}

class _MyDomainsPageState extends State<MyDomainsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    ValorMyDomains(),
                    ListDomains(),
                  ],
                ),
              )
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Adicionar'),
        icon: const Icon(Icons.add),
        onPressed: () {
          
        },
      ),
    );
  }
}