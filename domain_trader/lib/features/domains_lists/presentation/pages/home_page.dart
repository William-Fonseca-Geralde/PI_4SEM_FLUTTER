import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/list_domains.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/navbar.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/popup_menu.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/opcoes_domains.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/valor_invest.dart';
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
      appBar: AppBar(
        title: const Navbar(),
        actions: const [
          PopupMenu()
        ],
        automaticallyImplyLeading: false,
      ),
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
