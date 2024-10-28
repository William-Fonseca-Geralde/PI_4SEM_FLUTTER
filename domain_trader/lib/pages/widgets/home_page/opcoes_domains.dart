import 'package:flutter/material.dart';

class OpcoesDomains extends StatelessWidget {
  const OpcoesDomains({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}