import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemImage extends StatelessWidget {
  final String cartImage;

  const CartItemImage({Key key, this.cartImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.r),
        topLeft: Radius.circular(20.r),
      ),
      child: Image.network(
        cartImage,
        height: 120.h,
        width: 140.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
