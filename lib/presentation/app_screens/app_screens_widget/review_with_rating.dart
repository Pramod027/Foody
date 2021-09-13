import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_styles.dart';

class ReviewWithRating extends StatelessWidget {
  final double rating;

  const ReviewWithRating({Key key, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Review',
          style: AppStyles().descText,
        ),
        Spacer(),
        SmoothStarRating(
          starCount: 5,
          isReadOnly: false, //for user update
          size: 16.sp,
          rating: rating,
          color: Colors.redAccent,
          borderColor: Colors.red,
          allowHalfRating: false,
        ),
      ],
    );
  }
}
