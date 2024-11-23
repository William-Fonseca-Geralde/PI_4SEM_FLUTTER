import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final String? helpText;

  final GlobalKey<FormFieldState<String>> _passwordKey = GlobalKey();

  InputPassword({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.helpText,
    required this.controller,
  });

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingPadrao),
      child: TextFormField(
        controller: widget.controller,
        key: widget._passwordKey,
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
            )
          ),
          filled: true,
          suffixIcon: GestureDetector(
            child: IconButton(
              onPressed: () {
                setState(() {
                 _showPassword = !_showPassword;
                });
              },
              icon: Icon(_showPassword == false ? Icons.visibility_off : Icons.visibility)
            ),
          ),
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.lock),
          labelText: widget.labelText,
          helperText: widget.helpText
        ),
        obscureText: !_showPassword,
        validator: Validatorless.multiple(
          [
            Validatorless.min(8, 'A Senha deve conter no mínimo 8 caracteres'),
            Validatorless.required('A Senha é obrigatória'),
          ]
        ),
      ),
    );
  }
}