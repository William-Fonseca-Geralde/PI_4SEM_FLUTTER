import 'package:flutter/material.dart';

class AddDomain extends StatefulWidget {
  const AddDomain({super.key});

  @override
  State<AddDomain> createState() => _AddDomainState();
}

class _AddDomainState extends State<AddDomain> {
  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Text('Bom dia'),
    );
  }
}