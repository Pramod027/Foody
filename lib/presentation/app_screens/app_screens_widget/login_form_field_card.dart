import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_styles.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final IconData prefixIcon;
  final Widget suffixIcon;
  final String validator1;
  String validator2;
  TextEditingController input;
  String onSaved;
  final TextInputType inputType;
  bool hideText;

  CustomFormField(
      {Key key,
      this.labelText,
      this.prefixIcon,
      this.validator1,
      this.validator2,
      this.inputType,
      this.onSaved,
      this.suffixIcon,
      this.input,
      this.hideText})
      : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.r)),
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.suffixIcon,
        labelText: widget.labelText,
        labelStyle: AppStyles().mediumGrey,
      ),
      keyboardType: widget.inputType,
      controller: widget.input,
      style: AppStyles().smallText16,
      cursorColor: Colors.grey,
      obscureText: widget.hideText,
      validator: (String value) {
        if (value.isEmpty) {
          return widget.validator1;
        }

        if (value.length < 5 || value.length > 12) {
          return widget.validator2;
        }

        return null;
      },
      onSaved: (String value) {
        widget.onSaved = value;
      },
    );
  }
}
