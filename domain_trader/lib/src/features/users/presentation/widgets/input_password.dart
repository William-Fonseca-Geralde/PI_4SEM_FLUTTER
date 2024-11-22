import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String? helpText;

  const InputPassword({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.helpText
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
      ),
    );
  }
}