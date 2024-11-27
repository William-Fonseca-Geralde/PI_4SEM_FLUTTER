import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';

class DaterangeInput extends StatefulWidget {
  const DaterangeInput({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<DaterangeInput> createState() => _DaterangeInputState();
}

class _DaterangeInputState extends State<DaterangeInput> {
  DateTimeRange dateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(days: 10)) 
    );

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormFieldState<String>> _dateKey = GlobalKey();

    return Card.filled(
      margin: const EdgeInsets.all(paddingPadrao),
      child: Padding(
        padding: const EdgeInsets.all(paddingPadrao/2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 170,
              child: TextFormField(
                controller: widget.controller,
                key: _dateKey,
                keyboardType: TextInputType.datetime,
                inputFormatters: [MaskedInputFormatter('##/##/####')],
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2
                    )
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2
                    ),
                  ),
                  filled: true,
                  labelText: 'Data de Finalização',
                  hintText: 'Ex: ${DateFormat('dd/MM/yyyy').format(dateRange.end)}'
                ),
              ),
            ),
            IconButton.filled(
              onPressed: () {
                
              },
              icon: const Icon(Icons.date_range)
            )
          ],
        ),
      ),
    );
  }
}