import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:validatorless/validatorless.dart';

class InputText extends StatelessWidget {
  final TextEditingController? controller;
  final Icon prefixIcon;
  final String hintText;
  final String typeText;
  final String labelText;

  final GlobalKey<FormFieldState<String>> _nomeKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> _emailKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> _tellKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> _priceKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> _domainKey = GlobalKey();

  FormFieldValidator<String>? _ValidatorLess() {
    if (typeText == 'nome') {
      return Validatorless.required('Nome é obrigatório');
    } else if (typeText == 'email') {
      return Validatorless.multiple(
        [
          Validatorless.email('É necessário um e-mail válido'),
          Validatorless.required('E-mail é obrigatório')
        ]
      );
    } else if (typeText == 'tell') {
      return Validatorless.multiple(
        [
          Validatorless.min(8, 'Mínimo de 8 caracteres.'),
          Validatorless.required('Senha é obrigatória')
        ]
      );
    } else if (typeText == 'price') {
      return Validatorless.required('Valor é Obrigatório');
    } else if (typeText == 'domain') {
      return Validatorless.required('Domínio é obrigatório');
    } else if (typeText == 'cpf') {
      return Validatorless.multiple(
        [
          // Validatorless.cpf('Esse CPF não é válido'),
          Validatorless.min(14, 'Esse CPF não é válido'),
          Validatorless.required('O CPF é obrigatório'),
        ]
      );
    } else {
      return null;
    }
  }

  GlobalKey<FormFieldState<String>>? _FormKey() {
    if (typeText == 'nome') {
      return _nomeKey;
    } else if (typeText == 'email') {
      return _emailKey;
    } else if (typeText == 'tell') {
      return _tellKey;
    } else if (typeText == 'price') {
      return _priceKey;
    } else if (typeText == 'domain') {
      return _domainKey;
    } else {
      return null;
    }
  }

  TextInputType? _TypeText() {
    if (typeText == 'nome') {
      return TextInputType.name;
    } else if (typeText == 'email') {
      return TextInputType.emailAddress;
    } else if (typeText == 'tell') {
      return TextInputType.phone;
    } else if (typeText == 'price'){
      return const TextInputType.numberWithOptions(decimal: true);
    } else if (typeText == 'cpf') {
      return TextInputType.number;
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
    } else if (typeText == 'cpf') {
      return [MaskedInputFormatter('000.000.000-00')];
    } else {
      return null;
    }
  }

  InputText({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.typeText,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingPadrao),
      child: TextFormField(
        controller: controller,
        key: _FormKey(),
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
        validator: _ValidatorLess()
      ),
    );
  }
}