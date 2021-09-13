import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String initialValue;
  String saved;
  final String validator1;
  final String validator2;
  TextInputType inputType;
  final String labelText;
  CustomField(
      {Key key,
      this.labelText,
      this.initialValue,
      this.saved,
      this.validator1,
      this.inputType,
      this.validator2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      initialValue: initialValue,
      keyboardType: inputType,
      style: TextStyle(fontSize: 18),
      validator: (String value) {
        if (value.isEmpty) {
          return validator1;
        }

        if (value.length < 3 || value.length > 20) {
          return validator2;
        }

        return null;
      },
      onSaved: (String value) {
        saved = value;
      },
    );
  }
}
