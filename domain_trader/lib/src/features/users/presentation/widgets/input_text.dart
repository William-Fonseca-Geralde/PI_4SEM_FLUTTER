import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class InputText extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final String typeText;
  final String labelText;

  TextInputType? _TypeText() {
    if (typeText == 'nome') {
      return TextInputType.name;
    } else if (typeText == 'email') {
      return TextInputType.emailAddress;
    } else if (typeText == 'tell') {
      return TextInputType.phone;
    } else if (typeText == 'price'){
      return const TextInputType.numberWithOptions(decimal: true);
    } else {
      return null;
    }
  }

  List<TextInputFormatter>? _InputFomatter() {
    if (typeText == 'tell') {
      return [PhoneInputFormatter()];
    } else if (typeText == 'price'){
      return [CurrencyInputFormatter(
              leadingSymbol: 'R\$',
              useSymbolPadding: true
            )];
    } else {
      return null;
    }
  }

  const InputText({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.typeText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingPadrao),
      child: TextField(
        keyboardType: _TypeText(),
        inputFormatters: _InputFomatter(),
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
          hintText: hintText,
          prefixIcon: prefixIcon,
          labelText: labelText,
        ),
      ),
    );
  }
}