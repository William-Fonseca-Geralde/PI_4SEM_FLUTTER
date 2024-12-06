import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CategoryInput extends StatelessWidget {
  const CategoryInput({super.key, required this.dropdownMenuEntries, this.controller});

  final TextEditingController? controller;

  final List<DropdownMenuEntry> dropdownMenuEntries;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormFieldState<String>> _categoryKey = GlobalKey();

    return Padding(
      padding: const EdgeInsets.all(paddingPadrao),
      child: DropdownMenu(
        key: _categoryKey,
        controller: controller,
        width: MediaQuery.of(context).size.width / 4.5,
        enableSearch: false,
        enableFilter: false,
        inputDecorationTheme: const InputDecorationTheme(
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
          filled: true
        ),
        leadingIcon: const Icon(Icons.category_rounded),
        label: const Text('Categoria'),
        dropdownMenuEntries: List.generate(
          dropdownMenuEntries.length,
          (index) {
            return dropdownMenuEntries[index];
          },
        )
      ),
    );
  }
}