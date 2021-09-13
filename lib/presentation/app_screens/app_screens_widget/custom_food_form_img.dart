import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFoodFromImg extends StatelessWidget {
  final String image;
  final VoidCallback pressed;

  const CustomFoodFromImg({Key key, this.image, this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.1),
          radius: 50.r,
          child: SvgPicture.asset(
            image,
            height: 100.h,
            color: Colors.red.withOpacity(0.5),
          ),
        ),
        Positioned(
          bottom: 3,
          right: 0,
          child: GestureDetector(
            onTap: () => pressed(),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: Icon(
                Icons.camera_alt,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
