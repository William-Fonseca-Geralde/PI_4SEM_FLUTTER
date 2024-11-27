import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

class StatusInput extends StatefulWidget {
  const StatusInput({super.key, this.status, required this.onSelected});

  final List? status;
  final Function(String?) onSelected;

  @override
  State<StatusInput> createState() => _StatusInputState();
}

class _StatusInputState extends State<StatusInput> {
  
  String? _statusSelected;

  @override
  void initState() {
    super.initState();
    if (widget.status!.isNotEmpty) {
      _statusSelected = widget.status?.first;
      widget.onSelected(_statusSelected);
    }
  }

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
              children: widget.status!.map((stt) => ChoiceChip(
                label: Text(stt),
                selected: _statusSelected == stt,
                onSelected: (selected) {
                  setState(() {
                    _statusSelected = selected ? stt : null;
                  });
                  widget.onSelected(_statusSelected);
                },
              )).toList()
            ),
          ],
        ),
      ),
    );
  }
}