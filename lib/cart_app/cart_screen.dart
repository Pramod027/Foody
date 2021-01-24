//
//import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:scoped_model/scoped_model.dart';
//import 'package:workshop/cart_app/cart_model.dart';
//
//
//
//class CartScreen extends StatefulWidget {
////  final int price;
////
////  const TotalPrice({Key key, this.price}) : super(key: key);
//
//  @override
//  _CartScreenState createState() => _CartScreenState();
//}
//
//class _CartScreenState extends State<CartScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      //routes: {'/cart': (context) => TotalPrice()},
//      home: Scaffold(
//          appBar: AppBar(
//            backgroundColor: Colors.white,
//            title: Column(
//              children: <Widget>[
//                Text(
//                  "Cart",
//                  style: TextStyle(color: Colors.black),
//                ),
//              ],
//            ),
//            leading: IconButton(
//              icon: Icon(
//                Icons.arrow_back,
//                color: Colors.black,
//              ),
//              onPressed: () {
//                Navigator.pop(context);
//              },
//            ),
//            actions: <Widget>[
//              FlatButton(
//                  child: Text(
//                    "Clear",
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  onPressed: () =>
//                      ScopedModel.of<CartModel>(context).clearCart())
//            ],
//          ),
//          body: ScopedModel.of<CartModel>(context, rebuildOnChange: true)
//              .cart
//              .length ==
//              0
//              ? Center(
//            child: Text("No items in Cart"),
//          )
//              : Container(
//              padding: EdgeInsets.all(8.0),
//              child: Column(children: <Widget>[
//                Expanded(
//                  child: ListView.builder(
//                    itemCount: ScopedModel.of<CartModel>(context,
//                        rebuildOnChange: true)
//                        .total,
//                    itemBuilder: (context, index) {
//                      return ScopedModelDescendant<CartModel>(
//                        builder: (context, child, model) {
//                          return Card(
//                            child: ListTile(
//                              leading: Container(
//                                padding: EdgeInsets.all(
//                                    10),
//                                decoration: BoxDecoration(
//                                  color: Color(0xFFF5F6F9),
//                                  borderRadius: BorderRadius.circular(15),
//                                ),
//                                child: Image(
//                                    image: AssetImage(
//                                        model.cart[index].image)),
//                              ),
//                              title: Text(
//                                model.cart[index].title,
//                                maxLines: 2,
//                                style: TextStyle(
//                                    fontSize: 16.0, color: Colors.black),
//                              ),
//                              subtitle: Text.rich(TextSpan(
//                                  text:
//                                  "\$${model.cart[index].price.toString()}",
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.w600,
//                                      color: Colors.black,),
//                                  children: [
//                                    TextSpan(
//                                        text: " "
//                                            "x${model.cart[index].qty.toString()}",
//                                        style: Theme.of(context)
//                                            .textTheme
//                                            .bodyText1)
//                                  ])),
////                                  trailing: Row(
////                                      mainAxisSize: MainAxisSize.min,
////                                      children: [
////                                        IconButton(
////                                          icon: Icon(Icons.add),
////                                          onPressed: () {
////                                            model.updateProduct(
////                                                model.cart[index],
////                                                model.cart[index].qty + 1);
////                                            // model.removeProduct(model.cart[index]);
////                                          },
////                                        ),
////                                        IconButton(
////                                          icon: Icon(Icons.remove),
////                                          onPressed: () {
////                                            model.updateProduct(
////                                                model.cart[index],
////                                                model.cart[index].qty - 1);
////                                            // model.removeProduct(model.cart[index]);
////                                          },
////                                        ),
////                                      ]),
//                            ),
//                          );
//                        },
//                      );
//                    },
//                  ),
//                ),
//                Container(
//                  padding: EdgeInsets.symmetric(
//                    vertical: 15,
//                    horizontal: 30,
//                  ),
//                  // height: 174,
//                  decoration: BoxDecoration(
//                    color: Colors.white,
//                    borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(30),
//                      topRight: Radius.circular(30),
//                    ),
//                    boxShadow: [
//                      BoxShadow(
//                        offset: Offset(0, -15),
//                        blurRadius: 20,
//                        color: Color(0xFFDADADA).withOpacity(0.15),
//                      )
//                    ],
//                  ),
//                  child: SafeArea(
//                    child: Column(
//                      mainAxisSize: MainAxisSize.min,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Row(
//                          children: [
//                            Container(
//                              padding: EdgeInsets.all(10),
//                              height: 40,
//                              width: 40,
//                              decoration: BoxDecoration(
//                                color: Color(0xFFF5F6F9),
//                                borderRadius: BorderRadius.circular(10),
//                              ),
//                              child: SvgPicture.asset(
//                                  "assets/icons/receipt.svg"),
//                            ),
//                            Spacer(),
//                            Text("Add voucher code"),
//                            const SizedBox(width: 10),
//                            Icon(
//                              Icons.arrow_forward_ios,
//                              size: 12,
//                              color:Colors.black,
//                            )
//                          ],
//                        ),
//                        SizedBox(height:20),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//                            Text.rich(
//                              TextSpan(
//                                text: "Total: \$ " +
//                                    ScopedModel.of<CartModel>(context,
//                                        rebuildOnChange: true)
//                                        .totalCartValue
//                                        .toString() +
//                                    "",
//                                style: TextStyle(
//                                    fontSize: 16, color: Colors.black),
//                              ),
//                            ),
//                            SizedBox(
//                              width: 170,
//                              child: DefaultButton(
//                                text: "Check Out",
//                                press: () {},
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                )
//              ]))),
//    );
//  }
//
////  double total_price(price) {
////    double sum = 0;
////    @override
////    int setState(VoidCallback fn) {
////      sum = sum + price;
////    }
////
////    return sum;
////  }
//}
