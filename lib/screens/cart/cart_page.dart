//import 'dart:developer';
//import 'package:flutter/gestures.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/all.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:workshop/models/product.dart';
//import 'package:workshop/screens/cart/cart_page.dart';
//import 'package:workshop/screens/home/api_services.dart';
//
//class CartPage extends StatelessWidget {
//  final int id;
//
//  CartPage({Key key, this.id}) : super(key: key);
//
//  Services userService = Services();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white.withOpacity(1),
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 0,
//        title:
//            Text("Cart", style: TextStyle(color: Colors.grey.withOpacity(0.4))),
//        centerTitle: true,
//        leading: SizedBox(
//          height: 30,
//          width: 30,
//          child: IconButton(
//            icon: Icon(Icons.arrow_back_ios),
////            onPressed: () {
////              Navigator.pop(context);
////            },
//          ),
//        ),
//      ),
//      body: FutureBuilder(
//        future: userService.getProducts(id: id.toString()),
//        builder: (context, snapshot) {
//          List<Product> productList = snapshot.data;
//          return !snapshot.hasData
//              ? Center(child: CircularProgressIndicator())
//              : Container(
//                  child: ListView.builder(
//                    itemCount: snapshot.data.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      return Card(
//                        child: ListTile(
//                          leading: Container(
//                            padding: EdgeInsets.all(10.0),
//                            decoration: BoxDecoration(
//                              color: Color(0xFFF5F6F9),
//                              borderRadius: BorderRadius.circular(15),
//                            ),
//                            child: Image.network(productList[index].imageLink),
//                          ),
//                          title: Text(productList[index].name),
//                          subtitle: Text.rich(TextSpan(
//                              text: "${productList[index].price}",
//                              style: TextStyle(
//                                fontWeight: FontWeight.w600,
//                                color: Colors.red,
//                              ),
//                              children: [TextSpan(text: " ")])),
//                          trailing: Row(
//                            mainAxisSize: MainAxisSize.min,
//                            children: [
//                              IconButton(
//                                  icon: Icon(Icons.add),
//                                  onPressed: () {
//                                    productList.add(snapshot.data);
//                                  }),
//                              IconButton(
//                                  icon: Icon(Icons.remove), onPressed: () {})
//                            ],
//                          ),
//                        ),
//                      );
//                    },
//                  ),
//                );
//        },
//      ),
//      bottomNavigationBar: Container(child: Text("Total: ")),
//    );
//  }
//}
