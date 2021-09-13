import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/screen/screen_widgets.dart/screen_widget_export.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:workshop/widgets/widgets_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screen_widgets.dart/custom_dialog_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _key = GlobalKey<ScaffoldState>();
  OrderServices _orderServices = OrderServices();

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
        title: CustomText(text: "Shopping Cart"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: AppColor().white,
      body: app.isLoading
          ? Loading()
          : ListView.builder(
              itemCount: user.userModel.cart.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColor().white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColor().red.withOpacity(0.2),
                              offset: Offset(3, 2),
                              blurRadius: 30)
                        ]),
                    child: Row(
                      children: <Widget>[
                        CartItemImage(
                          cartImage: user.userModel.cart[index].image,
                        ),
                        kShboxH12,
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CustomQunatityPriceCard(
                                itemName: user.userModel.cart[index].name,
                                itemPrice: user.userModel.cart[index].price,
                                itemQuantity: user
                                    .userModel.cart[index].quantity
                                    .toString(),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: AppColor().red,
                                  ),
                                  onPressed: () async {
                                    app.changeLoading();
                                    bool value = await user.removeFromCart(
                                        cartItem: user.userModel.cart[index]);
                                    if (value) {
                                      user.reloadUserModel();
                                      print("Item added to cart");
                                      _key.currentState.showSnackBar(SnackBar(
                                          content: Text("Removed from Cart!")));
                                      app.changeLoading();
                                      return;
                                    } else {
                                      print("ITEM WAS NOT REMOVED");
                                      app.changeLoading();
                                    }
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
      bottomNavigationBar: Container(
        height: 70.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomCartTotal(
                totalPrice: user.userModel.totalCartPrice / 100,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor().primary),
                child: FlatButton(
                    onPressed: () {
                      if (user.userModel.totalCartPrice == 0) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogScreen(
                                  text: 'Your cart is empty');
                            });
                        return;
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.r)), //this right here
                              child: Container(
                                height: 200.h,
                                child: Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'You will be charged \$${user.userModel.totalCartPrice / 100} upon delivery!',
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 320.h,
                                        child: RaisedButton(
                                          onPressed: () async {
                                            var uuid = Uuid();
                                            String id = uuid.v4();
                                            _orderServices.createOrder(
                                                userId: user.user.uid,
                                                id: id,
                                                description:
                                                    "Some random description",
                                                status: "complete",
                                                totalPrice: user
                                                    .userModel.totalCartPrice,
                                                cart: user.userModel.cart);
                                            for (CartItemModel cartItem
                                                in user.userModel.cart) {
                                              bool value =
                                                  await user.removeFromCart(
                                                      cartItem: cartItem);
                                              if (value) {
                                                user.reloadUserModel();
                                                print("Item added to cart");
                                                _key.currentState.showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            "Removed from Cart!")));
                                              } else {
                                                print("ITEM WAS NOT REMOVED");
                                              }
                                            }
                                            _key.currentState.showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Order created!")));
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Accept",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: const Color(0xFF1BC0C5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320.h,
                                        child: RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Reject",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: AppColor().red),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: CustomText(
                      text: "Check out",
                      size: 20.w,
                      color: AppColor().white,
                      weight: FontWeight.normal,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
