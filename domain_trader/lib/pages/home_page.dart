import 'package:domain_trader/pages/widgets/popup_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> dominios = ['www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Domain Trader',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      PopupMenu(),
                    ],
                  ),
                ),
              )
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card.outlined(
                          margin: const EdgeInsets.all(20),
                          color: Colors.blueGrey,
                          child: SizedBox(
                            width: 450,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Valor',
                                        style: TextStyle(
                                          fontSize: 24
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FilledButton.tonal(
                                        onPressed: () {},
                                        child: const Text('Meus domínios')
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card.outlined(
                          margin: const EdgeInsets.all(12),
                          color: Colors.blueGrey,
                          child: Expanded(
                            child: SizedBox(
                              width: 450,
                              height: 65,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: FilledButton.tonal(
                                        onPressed: () {}, 
                                        child: const Text('Leilões')
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: FilledButton.tonal(
                                        onPressed: () {}, 
                                        child: const Text('Meus Investimentos')
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card.outlined(
                          margin: const EdgeInsets.all(12),
                          child: SizedBox(
                            width: 450,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 300,
                                      child: ListView.builder(
                                        itemCount: dominios.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(dominios[index]),
                                                ],
                                              ),
                                              const Divider()
                                            ],
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )
                            )
                          )
                        )
                      ],
                    )
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
