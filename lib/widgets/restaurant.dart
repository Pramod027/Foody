import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:workshop/widgets/widgets_export.dart';
import 'loading.dart';

class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantWidget({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2, left: 2, right: 2, bottom: 4),
      child: Stack(
        children: <Widget>[
          _backgroundImage(restaurant.image),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SmallButton(Icons.favorite),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Container(
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: AppColor().white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2.w),
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow[900],
                            size: 20.h,
                          ),
                        ),
                        Text(restaurant.rating.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.05),
                      Colors.black.withOpacity(0.025),
                    ],
                  )),
            ),
          )),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${restaurant.name} \n",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "avg meal price: ",
                          style: AppStyles().bodyMedium16),
                      TextSpan(
                        text: "\$${restaurant.avgPrice} \n",
                        style: AppStyles().bodyMedium16,
                      ),
                    ], style: TextStyle(color: AppColor().white)),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _backgroundImage(String image) {
    if (image.isEmpty || image == null) {
      return Container(
          height: 210.h,
          decoration: BoxDecoration(
            color: AppColor().grey.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: Image.asset(
              "assets/table.png",
              width: 120.w,
            ),
          ));
    } else {
      return Padding(
        padding: const EdgeInsets.all(0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.center,
                  child: Container(height: 120.h, child: Loading()),
                )),
                Center(
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage, image: restaurant.image),
                )
              ],
            )),
      );
    }
  }
}
