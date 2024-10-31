import 'package:domain_trader/constants.dart';
import 'package:domain_trader/pages/widgets/domain_details.dart';
import 'package:flutter/material.dart';

class ListDomains extends StatelessWidget {
  const ListDomains({super.key});

  void _showDomainDetails(BuildContext context, String domain) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DomainDetails(domain: domain);
      }
    );
  }

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
                              InkWell(
                                onTap: () {
                                  _showDomainDetails(context, dominios[index]);
                                },
                                child: Row(
                                  children: [
                                    Text(dominios[index]),
                                  ],
                                ),
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