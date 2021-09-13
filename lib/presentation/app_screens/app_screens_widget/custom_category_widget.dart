import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_sized_box.dart';

class CustomCategoryWidget extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback pressed;
  const CustomCategoryWidget({
    @required this.image,
    @required this.text,
    @required this.pressed,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => pressed()
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Burger()));
          ,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white70,
            ),
            height: 60.h,
            width: 60.w,
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                image,
                height: 25.h,
                color: Colors.red,
              ),
            ),
          ),
        ),
        kShboxH4,
        Text(
          text,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
