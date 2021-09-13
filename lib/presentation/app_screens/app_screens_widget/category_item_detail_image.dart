import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemDetailImage extends StatelessWidget {
  final String image;

  CategoryItemDetailImage({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(33),
            bottomRight: Radius.circular(33),
          ),
          color: Color(0xFFFECEFF1)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.network(
          image != null
              ? image
              : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
