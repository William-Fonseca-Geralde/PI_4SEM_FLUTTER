import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final String hintText;

  const InputPassword({
    super.key,
    required this.hintText
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
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: corPrimaria,
              width: 3
            )
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: corPrimaria,
              width: 3
            )
          ),
          filled: true,
          fillColor: corPrimariaClara,
          suffixIcon: GestureDetector(
            child: Icon(_showPassword == false ? Icons.visibility_off : Icons.visibility),
            onTap: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.lock)
        ),
        obscureText: !_showPassword,
      ),
    );
  }
}