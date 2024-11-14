import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/domains_lists/presentation/pages/my_domains_page.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/list_domains.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/navbar.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/popup_menu.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/opcoes_domains.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/valor_invest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

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
      body: [
        SafeArea(
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
        const MyDomainsPage(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget> [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Principal'
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.globe),
            label: 'Meus Domínios'
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Perfil'
          )
        ]
      ),
    );
  }
}
