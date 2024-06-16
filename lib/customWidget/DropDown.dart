import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;
  DropDown({super.key, required this.items, required this.onChanged,required this.hintText});
  @override
  State<DropDown> createState() => _DropDownState(items);
}

class _DropDownState extends State<DropDown> {
  List<String> items;
  String? dropDownValue;

  _DropDownState(this.items);

  @override
  void initState() {
    dropDownValue = items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String label=widget.hintText;
    return DropdownButtonFormField(
      dropdownColor: Color(0xFFE1F1F7),
      hint:Text(label),
      decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Color(0xFFA9C5CF)
          )
        ),
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
      borderRadius: BorderRadius.all(Radius.circular(20.0))
    );
  }
}
