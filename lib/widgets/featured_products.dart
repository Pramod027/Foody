import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:workshop/widgets/widgets_export.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final user = Provider.of<UserProvider>(context);

    return Container(
      height: 220.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productProvider.products.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
                child: GestureDetector(
                  onTap: () {
                    changeScreen(
                        _,
                        Details(
                          product: productProvider.products[index],
                        ));
                  },
                  child: Container(
                    height: 220.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                        color: AppColor().white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(-2, -1),
                              blurRadius: 5),
                        ]),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r)),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.center,
                                child: Loading(),
                              )),
                              Center(
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: productProvider.products[index].image,
                                  height: 126.h,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                text: productProvider.products[index].name ??
                                    "id null",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
//                                  setState(() {
//                                    productProvider.products[index].liked = !productProvider.products[index].liked;
//                                  });
//                                  productProvider.likeDislikeProduct(userId: user.userModel.id, product: productProvider.products[index], liked: productProvider.products[index].liked);
                                },
                                child: Container(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: CustomText(
                                    text: productProvider.products[index].rating
                                        .toString(),
                                    color: AppColor().grey,
                                    size: 14.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
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
                                  color: AppColor().red,
                                  size: 16.sp,
                                ),
                                Icon(
                                  Icons.star,
                                  color: AppColor().grey,
                                  size: 16.sp,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: CustomText(
                                text:
                                    "\$${productProvider.products[index].price / 100}",
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
