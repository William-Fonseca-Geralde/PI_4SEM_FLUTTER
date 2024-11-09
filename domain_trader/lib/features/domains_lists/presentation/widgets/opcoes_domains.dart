import 'package:flutter/material.dart';

class OpcoesDomains extends StatefulWidget {
  const OpcoesDomains({super.key});

  @override
  State<OpcoesDomains> createState() => _OpcoesDomainsState();
}

class _OpcoesDomainsState extends State<OpcoesDomains> {
  static final Set<String> _opcoesDomains = {'leiloes', 'investimento'};
  Set<String> _opcoesDomainsSegmented = {_opcoesDomains.first};

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SegmentedButton(
          showSelectedIcon: false,
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 50)),
            textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 26))
          ),
          segments: [
            ButtonSegment(value: _opcoesDomains.elementAt(0), label: const Text('Leilões')),
            ButtonSegment(value: _opcoesDomains.elementAt(1), label: const Text('Meus Investimentos'))
          ],
          selected: _opcoesDomainsSegmented,
          onSelectionChanged: (opcao) {
            setState(() {
              _opcoesDomainsSegmented = opcao;
            });
          },
        )
      ],
    );
  }
}