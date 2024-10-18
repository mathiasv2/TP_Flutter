import 'package:flutter/material.dart';

const List<String> operation = <String>["addition", "soustraction", "multiplication", "division"];

class DropdownCalcul extends StatefulWidget {
  const DropdownCalcul({super.key});

  @override
  State<DropdownCalcul> createState() => _DropdownCalcul();
}

class _DropdownCalcul extends State<DropdownCalcul> {
  String dropdownValue = operation.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: operation.first,
      onSelected: (String? value){
        setState(() {
          dropdownValue = value!;

        });
      },
      dropdownMenuEntries: 
      operation.map<DropdownMenuEntry<String>>((String value){
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}