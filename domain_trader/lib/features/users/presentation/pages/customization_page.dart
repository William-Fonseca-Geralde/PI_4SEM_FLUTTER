import 'package:flutter/material.dart';

const List<String> temas = ['Claro', 'Escuro'];

class CustomizationPage extends StatefulWidget {
  const CustomizationPage({super.key});

  @override
  State<CustomizationPage> createState() => _CustomizationPageState();
}

class _CustomizationPageState extends State<CustomizationPage> {
  String dropdownValue = temas.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalização'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text('Tema do App:'),
            
          ],
        )
      ),
    );
  }
}