//import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:workshop/models/product.dart';
//import 'package:workshop/screens/home/product_details.dart';
//import 'package:workshop/screens/home/search_products.dart';
//import 'package:workshop/screens/sign_in/login.dart';
//import 'package:workshop/services/auth_service.dart';
//
//import 'api_services.dart';
//
//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
//  Services userServices = Services();
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.blue[400],
//        title: IconButton(
//          icon: Icon(Icons.search),
//          onPressed: () {
//            showSearch(context: context, delegate: SearchProducts());
//          },
//        ),
//        actions: [
//          IconButton(
//            icon: Icon(
//              Icons.shopping_cart,
//              color: Colors.black,
//            ),
//            onPressed: () {},
//          ),
//          IconButton(
//            icon: Icon(
//              Icons.notifications,
//              color: Colors.black,
//            ),
//            onPressed: () {},
//          )
//        ],
//      ),
//      drawer: Drawer(
//        child: ListView(
//          children: <Widget>[
//            UserAccountsDrawerHeader(
//              accountName: Text("User"),
//              accountEmail: Text("user@gmail.com"),
//              currentAccountPicture: CircleAvatar(
//                backgroundColor: Colors.white,
//                child: Icon(Icons.person),
//              ),
//              decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                      begin: Alignment.centerLeft,
//                      end: Alignment.centerRight,
//                      colors: [Colors.purple, Colors.purpleAccent])),
//            ),
//            ListTile(
//              leading: Icon(Icons.home),
//              title: Text("Home"),
//              onTap: () {},
//            ),
//            ListTile(
//              leading: Icon(Icons.home),
//              title: Text("Home"),
//              onTap: () {},
//            ),
//            ListTile(
//              leading: Icon(Icons.person),
//              title: Text("User"),
//              onTap: () {},
//            ),
//            ListTile(
//              leading: Icon(Icons.home),
//              title: Text("Home"),
//              onTap: () {},
//            ),
//            ListTile(
//              leading: Icon(Icons.logout),
//              title: Text("Logout"),
//              onTap: () async {
//                //1111 await _auth.signOut();
//                final user = await AuthService.signOut();
//                if (user == null) {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => LoginScreen()));
//                } else {
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (context) => Home()));
//                }
//              },
//            ),
//          ],
//        ),
//      ),
//      body: FutureBuilder(
//        future: userServices.getProducts(),
//        builder: (context, snapshot) {
//          List<Product> productList = snapshot.data;
//          if (snapshot.hasError) {
//            return Center(
//              child: Text(snapshot.error),
//            );
//          }
//          return snapshot.hasData
//              ? Column(
//                  children: [
//                    Expanded(
//                        child: StaggeredGridView.countBuilder(
//                            crossAxisCount: 2,
//                            itemCount: productList.length,
//                            itemBuilder: (context, index) {
//                              return Card(
//                                elevation: 2,
//                                child: Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: [
//                                      Stack(
//                                        children: [
//                                          Container(
//                                            height: 180,
//                                            width: double.infinity,
//                                            clipBehavior: Clip.antiAlias,
//                                            decoration: BoxDecoration(
//                                              borderRadius:
//                                                  BorderRadius.circular(4),
//                                            ),
//                                            child: IconButton(
//                                              icon: Image.network(
//                                                productList[index].imageLink,
//                                                fit: BoxFit.cover,
//                                              ),
//                                              onPressed: () {
//                                                Navigator.push(
//                                                  context,
//                                                  MaterialPageRoute(
//                                                      builder: (context) =>
//                                                          ProductDetails(
//                                                              id: productList[
//                                                                      index]
//                                                                  .id)),
//                                                );
//                                              },
//                                            ),
//                                          ),
//                                          Positioned(
//                                            right: 0,
//                                            child: CircleAvatar(
//                                              backgroundColor: Colors.white,
//                                              child: IconButton(
//                                                icon: productList[index]
//                                                        .isFavorite
//                                                    ? Icon(Icons.favorite)
//                                                    : Icon(
//                                                        Icons.favorite_border),
//                                                onPressed: () {},
//                                              ),
//                                            ),
//                                          )
//                                        ],
//                                      ),
//                                      SizedBox(
//                                        height: 8,
//                                      ),
//                                      Text(
//                                        productList[index].name,
//                                        maxLines: 2,
//                                        style: TextStyle(
//                                            fontWeight: FontWeight.w800),
//                                        overflow: TextOverflow.ellipsis,
//                                      ),
//                                      SizedBox(
//                                        height: 8,
//                                      ),
//                                      if (productList[index].rating != null)
//                                        Container(
//                                          decoration: BoxDecoration(
//                                            color: Colors.green,
//                                            borderRadius:
//                                                BorderRadius.circular(12),
//                                          ),
//                                          padding: const EdgeInsets.symmetric(
//                                              horizontal: 4, vertical: 2),
//                                          child: Row(
//                                            mainAxisSize: MainAxisSize.min,
//                                            children: [
//                                              Text(
//                                                productList[index]
//                                                    .rating
//                                                    .toString(),
//                                                style: TextStyle(
//                                                    color: Colors.white),
//                                              ),
//                                              Icon(
//                                                Icons.star,
//                                                size: 16,
//                                                color: Colors.white,
//                                              )
//                                            ],
//                                          ),
//                                        ),
//                                      SizedBox(
//                                        height: 8,
//                                      ),
//                                      Text(
//                                        '\$${productList[index].price}',
//                                        style: TextStyle(fontSize: 32),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              );
//                            },
//                            staggeredTileBuilder: (index) =>
//                                StaggeredTile.fit(1)))
//                  ],
//                )
//              : Center(child: CircularProgressIndicator());
//        },
//      ),
//    );
//  }
//}
