import 'package:flutter/material.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:workshop/widgets/widgets_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDetailsImageDesc extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDescription;
  final int productPrice;

  const CustomDetailsImageDesc(
      {Key key,
      this.productImage,
      this.productName,
      this.productDescription,
      this.productPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 120,
          backgroundImage: NetworkImage(productImage),
        ),
        kShboxH16,
        CustomText(text: productName, size: 26.sp, weight: FontWeight.bold),
        CustomText(
            text: "\$${productPrice / 100}",
            size: 20.sp,
            weight: FontWeight.w400),
        kShboxH12,
        CustomText(text: "Description", size: 18.sp, weight: FontWeight.w400),
        Padding(
          padding: EdgeInsets.all(8.w),
          child: Text(
            productDescription,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: AppColor().grey, fontWeight: FontWeight.w300),
          ),
        ),
        kShboxH16,
      ],
    );
  }
}
