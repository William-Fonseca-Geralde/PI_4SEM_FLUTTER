import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final Icon suffixIcon;

  const InputText({
    super.key,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: corPrimaria,
            width: 3
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: corPrimaria,
            width: 3
          )),
        filled: true,
        fillColor: corPrimariaClara,
        hintText: 'Nome do Usuário'
      ),
    );
  }
}