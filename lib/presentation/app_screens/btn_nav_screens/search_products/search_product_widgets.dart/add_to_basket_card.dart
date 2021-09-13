import 'package:flutter/material.dart';
import 'package:workshop/shared/app_styles.dart';

class AddToBasketCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        color: Color(0xFF81C784),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: () async {
          // model.addProduct(foodNotifier.currentFood);
        },
        child: Text('Add To Basket', style: AppStyles().mediumBlock),
      ),
    );
  }
}
