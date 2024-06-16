import 'package:flutter/material.dart';

class CustomTextField{
  static Widget create({required String label,required TextEditingController controller,required FocusNode focus,
    required FocusNode? changeFocus,required BuildContext context}){
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height*0.03),
        TextFormField(
          controller: controller,
          focusNode:focus,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                    color: Color(0xFFA9C5CF)
                )
            ),
            contentPadding: EdgeInsets.all(15.0),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label is empty';
            }
            return null;
          },
          onEditingComplete: () {
              FocusScope.of(context).requestFocus(changeFocus);
          },
        ),
      ],
    );
  }
}
