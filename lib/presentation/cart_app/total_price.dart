import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/presentation/cart_app/custom_voucher_card.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:workshop/shared/app_styles.dart';

class TotalPrice extends StatefulWidget {
  @override
  _TotalPriceState createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Column(
              children: <Widget>[
                Text(
                  "Cart Items",
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Dancing',
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                      onPressed: () =>
                          ScopedModel.of<CartModel>(context).clearCart()),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Stack(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            //changeScreen(context, CartScreen());
                          },
                        ),
                        Positioned(
                          top: 6,
                          right: 2,
                          child: Image.asset(
                            ScopedModel.of<CartModel>(context,
                                            rebuildOnChange: true)
                                        .cart
                                        .length ==
                                    0
                                ? 'assets/images/red_circle.png'
                                : 'assets/images/green_circle.png',
                            height: 10.h,
                            width: 10.w,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          body: ScopedModel.of<CartModel>(context, rebuildOnChange: true)
                      .cart
                      .length ==
                  0
              ? Center(
                  child: Text(
                    "No items in Cart",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(8.w),
                  child: Column(children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: ScopedModel.of<CartModel>(context,
                                rebuildOnChange: true)
                            .total,
                        itemBuilder: (context, index) {
                          return ScopedModelDescendant<CartModel>(
                            builder: (context, child, model) {
                              return Card(
                                child: ListTile(
                                  leading: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F6F9),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.network(
//                                        image: NetworkImage(
                                      model.cart[index].image != null
                                          ? model.cart[index].image
                                          : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                      height: 60.h,
                                      width: 50.w,
                                    ),
                                  ),
                                  title: Text(
                                    model.cart[index].name,
                                    maxLines: 2,
                                    style: AppStyles().mediumText,
                                  ),
                                  subtitle: Text.rich(TextSpan(
                                      text:
                                          "\$${model.cart[index].price.toString()}",
                                      style: AppStyles().mediumText,
                                      children: [
                                        TextSpan(
                                            text: " "
                                                "x${model.cart[index].qty.toString()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1)
                                      ])),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            model.updateProduct(
                                                model.cart[index],
                                                model.cart[index].qty + 1);
                                            // model.removeProduct(model.cart[index]);
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            model.updateProduct(
                                                model.cart[index],
                                                model.cart[index].qty - 1);
                                            // model.removeProduct(model.cart[index]);
                                          },
                                        ),
                                      ]),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 30.w,
                      ),
                      // height: 174,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, -15),
                            blurRadius: 20,
                            color: Color(0xFFDADADA).withOpacity(0.15),
                          )
                        ],
                      ),
                      child: SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomVoucherCard(),
                            kShboxH20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "Total: \$ " +
                                        ScopedModel.of<CartModel>(context,
                                                rebuildOnChange: true)
                                            .totalCartValue
                                            .toString() +
                                        "",
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 170.w,
                                  child: FlatButton(
                                    child: Text('Check Out'),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ]))),
    );
  }
}
