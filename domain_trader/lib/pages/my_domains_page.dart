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
    );
  }
}