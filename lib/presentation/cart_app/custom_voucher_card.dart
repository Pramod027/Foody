import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/shared_export.dart';

class CustomVoucherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset("assets/receipt.svg"),
        ),
        Spacer(),
        Text("Add voucher code"),
        kShboxH12,
        Icon(
          Icons.arrow_forward_ios,
          size: 12.h,
          color: Colors.black,
        )
      ],
    );
  }
}
