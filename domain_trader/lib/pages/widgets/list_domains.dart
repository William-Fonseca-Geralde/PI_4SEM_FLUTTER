import 'package:domain_trader/constants.dart';
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
          color: corSecundaria,
          margin: const EdgeInsets.symmetric(vertical: paddingPadrao),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
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
                    ),
                  )
                ],
              ),
            )
          )
        )
      ],
    );
  }
}