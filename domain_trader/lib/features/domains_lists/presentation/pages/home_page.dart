import 'package:domain_trader/features/domains_lists/presentation/pages/domains_page.dart';
import 'package:domain_trader/features/domains_lists/presentation/pages/my_domains_page.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/navbar.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/popup_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        const DomainsPage(),
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
            icon: Icon(FontAwesomeIcons.gavel),
            label: 'Leilões'
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
