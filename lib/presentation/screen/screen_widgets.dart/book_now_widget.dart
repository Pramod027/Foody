import 'package:flutter/material.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:workshop/widgets/widgets_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookNowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CustomText(
          text: "Open",
          color: AppColor().green,
          weight: FontWeight.w400,
          size: 18.sp,
        ),
        Container(
            child: FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.restaurant_menu),
                label: CustomText(text: "Book Now")))
      ],
    );
  }
}
