import 'package:domain_trader/constants.dart';
import 'package:domain_trader/pages/widgets/list_domains.dart';
import 'package:domain_trader/pages/widgets/my_domains_page/valor_my_domains.dart';
import 'package:domain_trader/pages/widgets/navbar/navbar.dart';
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
            const Navbar(),
            Expanded(
              flex: 8,
              child: Container(
                color: corFundo,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(paddingPadrao),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Meus Domínios',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                        ],
                      )
                    ),
                    const ValorMyDomains(),
                    Padding(
                      padding: const EdgeInsets.only(right: paddingPadrao),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            onPressed: () {},
                            elevation: 8,
                            child: const Text('Novo')
                          ),
                        ],
                      ),
                    ),
                    const ListDomains(),
                  ],
                ),
              )
            )
          ],
        )
      ),
    );
  }
}