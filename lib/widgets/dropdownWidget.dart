import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final items = ["English", "Hindi"];

  String? value = "English";

  DropdownMenuItem<String> buildMenuItem(String text) {
    return DropdownMenuItem(
      value: text,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 23, color: Color.fromARGB(255, 51, 50, 50)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration:
          BoxDecoration(border: Border.all(width: 1.2, color: Colors.black)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            isExpanded: true,
            value: value,
            items: items.map(buildMenuItem).toList(),
            onChanged: (newvalue) {
              setState(() {
                value = newvalue;
              });
            }),
      ),
    );
  }
}
