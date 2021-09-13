import 'package:flutter/material.dart';
import 'package:workshop/shared/shared_export.dart';

class CustomQunatityPriceCard extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final String itemQuantity;

  const CustomQunatityPriceCard(
      {Key key, this.itemName, this.itemPrice, this.itemQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: itemName + "\n", style: AppStyles().boldText),
        TextSpan(
            text: "\$${itemPrice / 100} \n\n", style: AppStyles().smallText16),
        TextSpan(text: "Quantity: ", style: AppStyles().SmallGrey),
        TextSpan(text: itemQuantity.toString(), style: AppStyles().primaryText),
      ]),
    );
  }
}
