import 'package:flutter/material.dart';
class CustomTextField {
  static Widget create({
    required String label,
    required TextEditingController controller,
    required FocusNode focus,
    required FocusNode? changeFocus,
    required BuildContext context,
    TextInputType inputType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          focusNode: focus,
          keyboardType: inputType,
          decoration: InputDecoration(
            labelText: label,
          ),
          validator: validator ??
                  (value) {
                if (value == null || value.isEmpty) {
                  return '$label is empty';
                }
                return null;
              },
          onEditingComplete: () {
            if (changeFocus != null) {
              FocusScope.of(context).requestFocus(changeFocus);
            }
          },
        ),
      ],
    );
  }
}
