import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:workshop/shared/app_styles.dart';

class ExpandablePannelWidget extends StatelessWidget {
  final String ingredientsName;

  const ExpandablePannelWidget({Key key, this.ingredientsName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Row(
        children: [
          Chip(
            padding: EdgeInsets.all(8.w),
            backgroundColor: Colors.red.withOpacity(0.2),
            label: Text(
              ingredientsName,
              style: AppStyles().mediumText,
            ),
          ),
          kShboxH12,
        ],
      ),
    );
  }
}
