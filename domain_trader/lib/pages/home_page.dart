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
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Domain Trader',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Icon(Icons.person),
                      )
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card.outlined(
                          margin: EdgeInsets.all(20),
                          color: Colors.blueGrey,
                          child: SizedBox(
                            width: 450,
                            height: 100,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Valor'),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card.outlined(
                                    clipBehavior: Clip.hardEdge,
                                    margin: const EdgeInsets.all(12),
                                    color: Colors.white,
                                    child: InkWell(
                                      splashColor: Colors.grey,
                                      onTap: () {
                                        
                                      },
                                      child: const SizedBox(
                                        width: 120,
                                        height: 45,
                                        child: Text(
                                          'Leilões',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card.outlined(
                                    clipBehavior: Clip.hardEdge,
                                    margin: const EdgeInsets.all(12),
                                    color: Colors.white,
                                    child: InkWell(
                                      splashColor: Colors.grey,
                                      onTap: () {
                                        
                                      },
                                      child: const SizedBox(
                                        width: 120,
                                        height: 45,
                                        child: Text(
                                          'Meus Investimentos',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
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
                ),
              )
            ),
          ],
        )
      ),
    );
  }
}
