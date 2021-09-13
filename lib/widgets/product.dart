import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:workshop/shared/shared_export.dart';
import 'custom_text.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Padding(
      padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
      child: Container(
        height: 110.h,
        decoration: BoxDecoration(
            color: AppColor().white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]),
//            height: 160,
        child: Row(
          children: <Widget>[
            Container(
              width: 140.w,
              height: 120.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                ),
                child: Image.network(
                  product.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 8.h, left: 8.w),
                          child: CustomText(
                            text: product.name,
                            size: 18.sp,
                            weight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: AppColor().white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      offset: Offset(1, 1),
                                      blurRadius: 4),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Icon(
                                Icons.favorite_border,
                                color: AppColor().red,
                                size: 18.h,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    kShboxH2,
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () async {
                                await productProvider.loadProductsByRestaurant(
                                    restaurantId:
                                        product.restaurantId.toString());
                                await restaurantProvider.loadSingleRestaurant(
                                    retaurantId:
                                        product.restaurantId.toString());
                                changeScreen(
                                    context,
                                    RestaurantScreen(
                                      restaurantModel:
                                          restaurantProvider.restaurant,
                                    ));
                              },
                              child: CustomText(
                                text: product.restaurant,
                                color: Colors.grey,
                                weight: FontWeight.w600,
                                size: 15.sp,
                              )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Icon(
                                Icons.star,
                                color: AppColor().red,
                                size: 16.sp,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: AppColor().red,
                              size: 16.sp,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColor().red,
                              size: 16.sp,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColor().grey,
                              size: 16.sp,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: CustomText(
                                text: product.rating.toString(),
                                color: Colors.black,
                                weight: FontWeight.bold,
                                size: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: CustomText(
                            text: "\$${product.price / 100}",
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
