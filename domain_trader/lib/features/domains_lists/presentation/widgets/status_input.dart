import 'package:domain_trader/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

class StatusInput extends StatefulWidget {
  const StatusInput({super.key});

  @override
  State<StatusInput> createState() => _StatusInputState();
}

class _StatusInputState extends State<StatusInput> {
  List status = ['disponível', 'vendido', 'pausado'];
  String? _statusSelected;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: const EdgeInsets.all(paddingPadrao),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: paddingPadrao/2),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.verified),
              title: Text('Status do Domínio'),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 5,
              spacing: 5,
              children: status.map((stt) => ChoiceChip(
                label: Text(stt),
                selected: _statusSelected == stt,
                onSelected: (selected) {
                  setState(() {
                    _statusSelected = selected ? stt : null;
                  });
                },
              )).toList()
            ),
          ],
        ),
      ),
    );
  }
}