import 'package:flutter/material.dart';

import '../styles/theme.dart';

class DropDown extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;
  const DropDown({super.key, required this.items, required this.onChanged,required this.hintText});
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late List<String> items;
  String? dropDownValue;

  @override
  void initState() {
    items=widget.items;
    dropDownValue = items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String label=widget.hintText;
    return DropdownButtonFormField(
      dropdownColor: AppTheme.bgColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hint:Text(label),
      decoration: InputDecoration(
        hintText: label,
      ),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(5.0,1.0,0.0,0.0),
          child: Text(value)
          ),
        );
      }).toList(),
      validator: (value){
        if (value == null || value.isEmpty) {
          return "Please mention your $label" ;
        }
        return null;
      },
      onChanged: (String? value) {
        setState(() {
          dropDownValue = value;
        });
        widget.onChanged(value);
      },
      borderRadius:
      const BorderRadius.all(Radius.circular(20.0))
    );
  }
}



