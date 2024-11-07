import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/pages/widgets/list_domains.dart';
import 'package:domain_trader/features/pages/widgets/navbar/navbar.dart';
import 'package:domain_trader/features/pages/widgets/opcoes_domains.dart';
import 'package:domain_trader/features/pages/widgets/valor_invest.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                    ValorInvest(),
                    OpcoesDomains(),
                    ListDomains(),
                  ],
                )
              ),
            )
          ],
        )
      ),
    );
  }
}
