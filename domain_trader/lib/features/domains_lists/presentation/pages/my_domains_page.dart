import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/list_domains.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/navbar.dart';
import 'package:domain_trader/features/domains_lists/presentation/widgets/popup_menu.dart';
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
                    const ListDomains(),
                    Padding(
                      padding: const EdgeInsets.only(right: paddingPadrao),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FilledButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.red)
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Voltar à Página')
                          ),
                          FilledButton(
                            style: const ButtonStyle(
                              fixedSize: WidgetStatePropertyAll(Size(100, 50))
                            ),
                            onPressed: () {},
                            child: const Text('Novo')
                          ),
                        ],
                      ),
                    ),
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