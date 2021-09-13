import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:workshop/shared/app_styles.dart';

class CategoryItemCard extends StatelessWidget {
  final VoidCallback pressed;
  final String image;
  final String itemName;
  final String itemRating;

  CategoryItemCard(
      {Key key, this.pressed, this.image, this.itemName, this.itemRating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () => pressed(),
              child: Container(
                height: 90.h,
                width: 90.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      image != null
                          ? image
                          : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemName,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles().bold20,
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    Text(
                      "The Village Cafe and Resturant",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.red,
                          size: 16.w,
                        ),
                        kShboxH2,
                        Text(itemRating, style: AppStyles().bodyMedium16),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
