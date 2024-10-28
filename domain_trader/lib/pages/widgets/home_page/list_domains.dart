import 'package:flutter/material.dart';

class ListDomains extends StatelessWidget {
  const ListDomains({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> dominios = ['www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', 'www.teste.com', ];

    return Row(
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
    );
  }
}