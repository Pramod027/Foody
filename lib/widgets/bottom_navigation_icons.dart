import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'custom_text.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  const BottomNavIcon({Key key, this.image, this.name, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/$image",
              width: 20.h,
              height: 20.h,
            ),
            kShboxH2,
            CustomText(
              text: name,
            )
          ],
        ),
      ),
    );
  }
}
