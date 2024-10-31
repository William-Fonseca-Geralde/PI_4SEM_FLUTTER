import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;

  const InputText({
    super.key,
    required this.prefixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingPadrao),
      child: TextField(
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
          fillColor: const Color(0xFFECEBEB),
          hintText: hintText,
          prefixIcon: prefixIcon,
          
        ),
      ),
    );
  }
}