import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_sized_box.dart';

class FeedScreenCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFECEFF1)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            child: Image.asset(
              'assets/images/burger.png',
              height: 60.h,
              width: 60.w,
            ),
          ),
          Positioned(
            top: 26,
            left: 110,
            child: Text(
              'Order Fresh Foods',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18.sp,
              ),
            ),
          ),
          kShboxH12,
          Positioned(
            top: 45,
            left: 120,
            child: Text(
              'Get Up To 40% OFF',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 12.sp,
                color: Color(0xFF81C784),
              ),
            ),
          ),
          Positioned(
            top: -30,
            right: -50,
            child: Image.asset(
              'assets/images/banner.png',
              height: 80.h,
            ),
          ),
          Positioned(
            bottom: -20,
            right: -20,
            child: Image.asset(
              'assets/images/banner3.png',
              height: 80.h,
            ),
          ),
        ],
      ),
    );
  }
}
