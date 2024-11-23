import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/lance_dialog.dart';
import 'package:flutter/material.dart';

class DomainDetails extends StatelessWidget {
  final String domain;

  const DomainDetails({
    super.key,
    required this.domain,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        heightFactor: 0.55,
        widthFactor: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Detalhes do Leilão',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close)
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(paddingPadrao),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    domain,
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'R\$ Valor Mínimo',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(paddingPadrao),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card.outlined(
                              child: Padding(
                                padding: EdgeInsets.all(paddingPadrao),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      child: Icon(Icons.person),
                                    ),
                                    SizedBox(height: paddingPadrao),
                                    Text('Nome do Dono'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: paddingPadrao),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FilledButton(
                              onPressed: () {
                                showDialog(
                                  context: context, 
                                  builder: (BuildContext context) => const LanceDialog()
                                );
                              }, 
                              child: const Text('Dar Lance')
                            ),
                            const SizedBox(height: paddingPadrao),
                            const FilledButton.tonal(
                              onPressed: null,
                              child: Text('Desfazer aposta')
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}