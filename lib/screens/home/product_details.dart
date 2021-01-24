//import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:workshop/models/product.dart';
//import 'package:workshop/screens/cart/cart_page.dart';
//import 'package:workshop/screens/home/api_services.dart';
//
//class ProductDetails extends StatefulWidget {
//  final int id;
//
//  const ProductDetails({Key key, this.id}) : super(key: key);
//
//  @override
//  _ProductDetailsState createState() => _ProductDetailsState();
//}
//
//class _ProductDetailsState extends State<ProductDetails> {
//  Services userService = Services();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      appBar: AppBar(
//        backgroundColor: Colors.grey.withOpacity(0.1),
//        elevation: 0,
//        leading: IconButton(
//          icon: Icon(
//            Icons.arrow_back_ios,
//            color: Colors.grey,
//          ),
//          onPressed: () {
//            Navigator.pop(context);
//          },
//        ),
//        actions: [
//          IconButton(
//              padding: EdgeInsets.only(right: 10.0),
//              icon: Icon(
//                Icons.shopping_cart,
//                color: Colors.grey,
//              ),
//              onPressed: () {
////                Navigator.push(
////                  context,
////                  MaterialPageRoute(builder: (context) => CartPage()),
////                );
//              })
//        ],
//      ),
//      body: ListView(
//        children: [
//          FutureBuilder(
//            future: userService.getProducts(id: widget.id.toString()),
//            builder: (context, snapshot) {
//              List<Product> productList = snapshot.data;
//              return !snapshot.hasData
//                  ? Center(child: LinearProgressIndicator())
//                  : Column(
//                      children: [
//                        Container(
//                          height: MediaQuery.of(context).size.height * 0.5,
//                          color: Color(0xFFF6F7F9),
//                          child: Column(
//                            children: [
//                              Container(
//                                color: Color(0xFFF6F7F9),
//                                width: MediaQuery.of(context).size.width,
//                                child: Row(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                    SizedBox(
//                                      height:
//                                          MediaQuery.of(context).size.height *
//                                              0.35,
////                                  width:
////                                      MediaQuery.of(context).size.width * 0.7,
//                                      child: Hero(
//                                        tag: '${productList[0].id}',
//                                        child: Image.network(
//                                            productList[0].imageLink),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                              AnimatedContainer(
//                                duration: Duration(seconds: 2),
//                                margin: EdgeInsets.only(right: 15),
//                                padding: EdgeInsets.all(8),
//                                height: 50,
//                                width: 50,
//                                decoration: BoxDecoration(
//                                  color: Colors.white,
//                                  borderRadius: BorderRadius.circular(10),
//                                  border: Border.all(color: Colors.pink),
//                                ),
//                                child: Image.network(productList[0].imageLink),
//                              ),
//                            ],
//                          ),
//                        ),
//                        Container(
//                          height: MediaQuery.of(context).size.height * 0.5,
//                          width: double.infinity,
//                          decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.only(
//                              topLeft: Radius.circular(40),
//                              topRight: Radius.circular(40),
//                            ),
//                          ),
//                          child: Column(
//                            children: <Widget>[
//                              Padding(
//                                padding: EdgeInsets.symmetric(horizontal: 20.0),
//                                child: Text(
//                                  productList[0].name,
//                                  style: Theme.of(context).textTheme.headline6,
//                                ),
//                              ),
//                              Align(
//                                alignment: Alignment.centerRight,
//                                child: Container(
//                                  padding: EdgeInsets.all(15.0),
//                                  width: 64.0,
//                                  decoration: BoxDecoration(
//                                    color: Color(0xFFF5F6F9),
//                                    borderRadius: BorderRadius.only(
//                                      topLeft: Radius.circular(20),
//                                      bottomLeft: Radius.circular(20),
//                                    ),
//                                  ),
//                                  child: SvgPicture.asset(
//                                    "assets/images/Heart Icon_2.svg",
//                                    color: Color(0xFFFF4848),
//                                    height: 16.0,
//                                  ),
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(
//                                  left: 20,
//                                  right: 64,
//                                ),
//                                child: Text(
//                                  productList[0].description,
//                                  maxLines: 3,
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                  horizontal: 20,
//                                  vertical: 10,
//                                ),
//                                child: GestureDetector(
//                                  onTap: () {},
//                                  child: Row(
//                                    children: [
//                                      Tooltip(
//                                        decoration: BoxDecoration(
//                                          color: Colors.black.withOpacity(0.5),
//                                          borderRadius:
//                                              BorderRadius.circular(20),
//                                        ),
//                                        message:
//                                            '${productList[0].description}',
//                                        child: Text(
//                                          "See More Detail",
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.w600,
//                                              color: Colors.black),
//                                        ),
//                                      ),
//                                      SizedBox(width: 5),
//                                      Icon(
//                                        Icons.arrow_forward_ios,
//                                        size: 12,
//                                        color: Colors.black,
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                              RaisedButton(
//                                color: Colors.white,
//                                shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.circular(20),
//                                ),
//                                onPressed: () {
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) =>
//                                            CartPage(id: productList[0].id)),
//                                  );
//                                },
//                                child: Text('Add to Cart'),
//                              )
//                            ],
//                          ),
//                        )
//                      ],
//                    );
//            },
//          ),
//        ],
//      ),
//    );
//  }
//}
