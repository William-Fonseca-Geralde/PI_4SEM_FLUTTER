import 'package:flutter/material.dart';

class CategoryInput extends StatelessWidget {
  const CategoryInput({super.key, required this.dropdownMenuEntries});

  final List<DropdownMenuEntry> dropdownMenuEntries;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: List.generate(
        dropdownMenuEntries.length,
        (index) {
          return dropdownMenuEntries[index];
        },
      )
    );
  }
}