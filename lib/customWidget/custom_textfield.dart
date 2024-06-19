import 'package:flutter/material.dart';
class CustomTextField {
  static Widget create({
    required String label,
    required TextEditingController controller,
    required FocusNode focus,
    required FocusNode? changeFocus,
    required BuildContext context,
    bool obscureText=false,
    TextInputType inputType = TextInputType.text,
    String? Function(String?)? validator,
    void Function()? onEditingComplete
  }) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          focusNode: focus,
          obscureText: obscureText,
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
          onEditingComplete: onEditingComplete ?? () {
            if (changeFocus != null) {
              FocusScope.of(context).requestFocus(changeFocus);
            }
          },
        ),
      ],
    );
  }
}
