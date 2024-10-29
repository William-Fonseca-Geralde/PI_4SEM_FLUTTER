import 'package:flutter/material.dart';

class OpcoesDomains extends StatelessWidget {
  const OpcoesDomains({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card.outlined(
          margin: const EdgeInsets.symmetric(vertical: 16),
          color: Colors.blueGrey,
          child: Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              height: (MediaQuery.of(context).size.height) / 10,
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
      ]
    );
  }
}