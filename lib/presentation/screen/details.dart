import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:workshop/widgets/widgets_export.dart';

class Details extends StatefulWidget {
  final ProductModel product;

  const Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor().black),
        backgroundColor: AppColor().white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              changeScreen(context, CartScreen());
            },
          ),
        ],
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: AppColor().white,
      body: SafeArea(
        child: app.isLoading
            ? Loading()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomDetailsImageDesc(
                    productImage: widget.product.image,
                    productName: widget.product.name,
                    productDescription: widget.product.description,
                    productPrice: widget.product.price,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              size: 36.h,
                            ),
                            onPressed: () {
                              if (quantity != 1) {
                                setState(() {
                                  quantity -= 1;
                                });
                              }
                            }),
                      ),
                      GestureDetector(
                        onTap: () async {
                          app.changeLoading();
                          print("All set loading");

                          bool value = await user.addToCard(
                              product: widget.product, quantity: quantity);
                          if (value) {
                            print("Item added to cart");
                            _key.currentState.showSnackBar(
                                SnackBar(content: Text("Added ro Cart!")));
                            user.reloadUserModel();
                            app.changeLoading();
                            return;
                          } else {
                            print("Item NOT added to cart");
                          }
                          print("lOADING SET TO FALSE");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor().primary,
                              borderRadius: BorderRadius.circular(20)),
                          child: app.isLoading
                              ? Loading()
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 28.w, vertical: 12.h),
                                  child: CustomText(
                                    text: "Add $quantity To Cart",
                                    color: AppColor().white,
                                    size: 22.sp,
                                    weight: FontWeight.w300,
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            icon: Icon(
                              Icons.add,
                              size: 36,
                              color: AppColor().red,
                            ),
                            onPressed: () {
                              setState(() {
                                quantity += 1;
                              });
                            }),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
