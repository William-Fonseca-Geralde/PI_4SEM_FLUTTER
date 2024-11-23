import 'package:domain_trader/src/features/domains_lists/presentation/pages/add_domain_page.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/list_domains.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/valor_invest.dart';
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
      body: const SafeArea(
        child: Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ValorInvest(),
              ListDomains(selectedOption: 'mydomains'),
            ],
          )
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Adicionar'),
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const AddDomainPage(),
          );
        },
      ),
    );
  }
}