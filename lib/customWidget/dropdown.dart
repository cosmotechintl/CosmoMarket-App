import 'package:cosmomarket/customWidget/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../theme/Theme.dart';

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
      borderRadius: BorderRadius.all(Radius.circular(20.0))
    );
  }
}

class DropDownWithSearchBar extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;

  DropDownWithSearchBar({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  State<DropDownWithSearchBar> createState() => _DropDownWithSearchBarState();
}

class _DropDownWithSearchBarState extends State<DropDownWithSearchBar> {
  String? dropDownValue;

  @override
  void initState() {
    dropDownValue = widget.items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String label = widget.hintText;
    return DropdownButtonFormField<String>(
      dropdownColor: AppTheme.primaryColor, // Replace with your desired dropdown color
      autovalidateMode: AutovalidateMode.onUserInteraction,
      value: dropDownValue,
      decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      items: [
        // Custom widget example before dropdown items
        DropdownMenuItem<String>(
          value: 'custom',
          child: CustomTextField.create(
            label: "hello",
            controller: TextEditingController(),
            focus: FocusNode(),
            changeFocus: FocusNode(),
            context: context,
          ),
        ),
        // Dropdown items generated from widget.items
        ...widget.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 0.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select an item";
        }
        return null;
      },
      onChanged: (String? value) {
        setState(() {
          dropDownValue = value;
        });
        widget.onChanged(value);
      },
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    );
  }
}





