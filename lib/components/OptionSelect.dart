import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class OptionSelect extends StatefulWidget {
  @override
  _OptionSelectState createState() => _OptionSelectState();
}

class _OptionSelectState extends State<OptionSelect> {
  final items = ['Male', 'Female'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: value,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
        // children: [
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  iconSize: 25,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  items: items.map(itemSelect).toList(),
                  onChanged: (value) => setState(() => this.value = value),
                ),
            ),
          ),
        // ],
      ),
    );
  }
  DropdownMenuItem<String> itemSelect(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}