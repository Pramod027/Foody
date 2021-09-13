import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileDialogBox extends StatelessWidget {
  final String image;
  final String text;
  IconData iconData;

  CustomProfileDialogBox({
    @required this.image,
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.grey.withOpacity(0.1)),
      child: ListTile(
        leading: SvgPicture.asset(
          image,
          color: Colors.red,
          height: 30.h,
        ),
        title: Text(text),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
