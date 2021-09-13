import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/shared_export.dart';

class AppStyles {
  final title = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: Colors.black);

  final bold20 = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black);
  final body16 = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300);

  final bodyMedium16 = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);

  final mediumRed = TextStyle(
      color: AppColor().red, fontSize: 22.sp, fontWeight: FontWeight.w400);

  final mediumBlock =
      TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400);
  final smallText16 = TextStyle(
      color: AppColor().black, fontSize: 18.sp, fontWeight: FontWeight.w300);
  final primaryText = TextStyle(
      color: AppColor().primary,
      fontSize: 22.sp,
      fontWeight: FontWeight.normal);

  final mediumGrey =
      TextStyle(color: AppColor().grey, fontWeight: FontWeight.w300);

  final SmallGrey = TextStyle(
      color: AppColor().grey, fontSize: 16.sp, fontWeight: FontWeight.w400);
  final boldText = TextStyle(
      color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold);

  final titleText = TextStyle(
      color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600);

  final descText = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400);

  final ratingColor = TextStyle(color: Colors.red, fontSize: 14.0);

  final mediumText = TextStyle(fontSize: 16.sp, color: Colors.black);

  final greyBody = TextStyle(
      color: Colors.grey, fontFamily: 'Dancing', fontWeight: FontWeight.w600);

  final whiteBold = TextStyle(
      color: Colors.white,
      fontFamily: 'Dancing',
      fontSize: 30.sp,
      fontWeight: FontWeight.bold);

  final headText = TextStyle(
      color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.w400);

  final boldItallic = TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontFamily: 'Dancing');
  final sentMessage = TextStyle(
      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12.sp);

  final receiveMessage = TextStyle(
      color: Colors.blue, fontSize: 12.sp, fontWeight: FontWeight.w400);
  final subIngridents = TextStyle(
      color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400);

  final body18 = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500);
  final blac54 = TextStyle(
      color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 18.sp);
  final appName = TextStyle(
      color: Colors.black,
      fontSize: 30.sp,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontFamily: 'Dancing');
}
