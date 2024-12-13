import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

class DaterangeInput extends StatefulWidget {
  const DaterangeInput({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<DaterangeInput> createState() => _DaterangeInputState();
}

class _DaterangeInputState extends State<DaterangeInput> {
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormFieldState<String>> _dateKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.controller?.text = DateFormat('dd/MM/yyyy').format(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {

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
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2
                    ),
                  ),
                  filled: true,
                  labelText: 'Data de Finalização',
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Data é obrigatória'),
                ]),
              ),
            ),
            IconButton.filled(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateFormat('dd/MM/yyyy').parse(widget.controller!.text),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2030),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                );
                if (newDate == null) return;

                setState(() => widget.controller?.text = DateFormat('dd/MM/yyyy').format(newDate));
              },
              icon: const Icon(Icons.date_range)
            )
          ],
        ),
      ),
    );
  }
}