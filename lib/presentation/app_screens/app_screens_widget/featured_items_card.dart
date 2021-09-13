import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:workshop/shared/app_styles.dart';

class FeaturedItemsCard extends StatelessWidget {
  String featuredItemImage;
  final String featuredItemName;
  final String rating;
  final double ratingValue;
  final String price;
  final VoidCallback pressed;
  FeaturedItemsCard(
      {Key key,
      this.featuredItemName,
      this.rating,
      this.ratingValue,
      this.price,
      this.featuredItemImage,
      this.pressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 190.h,
          width: 175.w,
//                        margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                child: Container(
                  width: 130.w,
                  height: 100.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () => pressed(),
                      child: Image.network(
                        featuredItemImage = null
                            ? featuredItemImage
                            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      featuredItemName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {})
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          rating,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ),
                      SmoothStarRating(
                        starCount: 5,
                        isReadOnly: false, //for user update
                        size: 16,
                        rating: ratingValue,
                        color: Colors.redAccent,
                        borderColor: Colors.red,
                        allowHalfRating: false,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text('\$$price', style: AppStyles().boldText),
                  )
                ],
              )
            ],
          ),
        ),
        kShboxH12
      ],
    );
  }
}
