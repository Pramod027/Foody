import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/shared_export.dart';

class LikeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColor().white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300], offset: Offset(1, 1), blurRadius: 4),
            ]),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Icon(
            Icons.favorite_border,
            color: AppColor().red,
            size: 18.sp,
          ),
        ),
      ),
    );
  }
}
