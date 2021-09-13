import 'package:flutter/material.dart';
import 'package:workshop/shared/shared_export.dart';

class CustomCartTotal extends StatelessWidget {
  final double totalPrice;

  const CustomCartTotal({Key key, this.totalPrice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: "Total: ", style: AppStyles().mediumRed),
        TextSpan(text: '\$$totalPrice', style: AppStyles().primaryText),
      ]),
    );
  }
}
