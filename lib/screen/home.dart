import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:workshop/helpers/screen_navigation.dart';
import 'package:workshop/helpers/style.dart';
import 'package:workshop/providers/app.dart';
import 'package:workshop/providers/category.dart';
import 'package:workshop/providers/product.dart';
import 'package:workshop/providers/restaurant.dart';
import 'package:workshop/providers/user.dart';
import 'package:workshop/screen/cart.dart';
import 'package:workshop/screen/login.dart';
import 'package:workshop/screen/product_search.dart';
import 'package:workshop/screen/restaurant.dart';
import 'package:workshop/screen/restaurants_search.dart';
import 'package:workshop/widgets/categories.dart';
import 'package:workshop/widgets/custom_text.dart';
import 'package:workshop/widgets/featured_products.dart';
import 'package:workshop/widgets/loading.dart';
import 'package:workshop/widgets/restaurant.dart';

import 'category.dart';
import 'order.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _folded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _folded = false;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    restaurantProvider.loadSingleRestaurant();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomText(
          text: "Foody",
          color: black,
          weight: FontWeight.bold,
        ),
        actions: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: _folded ? 56 : 200,
            height: 56,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              // boxShadow: kElevationToShadow[6],
            ),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: !_folded
                      ? TextField(
                          textInputAction: TextInputAction.search,
                          onSubmitted: (pattern) async {
                            app.changeLoading();
                            await productProvider.search(productName: pattern);
                            changeScreen(context, ProductSearchScreen());
                            app.changeLoading();
                          },
                          decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        )
                      : null,
                )),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  //fixing the splash
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      //fixing the BorderRadius of the screen
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_folded ? 32 : 0),
                        topRight: Radius.circular(32),
                        bottomLeft: Radius.circular(_folded ? 32 : 0),
                        bottomRight: Radius.circular(32),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          _folded ? Icons.search : Icons.close,
                          color: Colors.grey,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _folded = !_folded;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_bag_outlined),
                onPressed: () {
                  changeScreen(context, CartScreen());
                },
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
//      drawer: Drawer(
//        child: ListView(
//          children: <Widget>[
//            UserAccountsDrawerHeader(
//              decoration: BoxDecoration(color: primary),
//              accountName: CustomText(
//                text: user.userModel?.name ?? "username lading...",
//                color: white,
//                weight: FontWeight.bold,
//                size: 18,
//              ),
//              accountEmail: CustomText(
//                text: user.userModel?.email ?? "email loading...",
//                color: white,
//              ),
//            ),
//            ListTile(
//              onTap: () {
//                changeScreen(context, Home());
//              },
//              leading: Icon(Icons.home),
//              title: CustomText(text: "Home"),
//            ),
//            ListTile(
//              onTap: () async {
//                await user.getOrders();
//                changeScreen(context, OrdersScreen());
//              },
//              leading: Icon(Icons.bookmark_border),
//              title: CustomText(text: "My orders"),
//            ),
//            ListTile(
//              onTap: () {
//                changeScreen(context, CartScreen());
//              },
//              leading: Icon(Icons.shopping_cart),
//              title: CustomText(text: "Cart"),
//            ),
//            ListTile(
//              onTap: () {
//                user.signOut();
//                changeScreenReplacement(context, LoginScreen());
//              },
//              leading: Icon(Icons.exit_to_app),
//              title: CustomText(text: "Log out"),
//            ),
//          ],
//        ),
//      ),
      backgroundColor: white,
      body: app.isLoading
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Loading()],
              ),
            )
          : SafeArea(
              child: ListView(
                children: <Widget>[
//                  Container(
//                    decoration: BoxDecoration(
//                        color: primary,
//                        borderRadius: BorderRadius.only(
//                            bottomRight: Radius.circular(20),
//                            bottomLeft: Radius.circular(20))),
//                    child: Padding(
//                      padding: const EdgeInsets.only(
//                          top: 8, left: 8, right: 8, bottom: 10),
//                      child: Container(
//                        decoration: BoxDecoration(
//                          color: white,
//                          borderRadius: BorderRadius.circular(20),
//                        ),
//                        child: ListTile(
//                          trailing: Icon(
//                            Icons.search,
//                            color: red,
//                          ),
//                          title: TextField(
//                            textInputAction: TextInputAction.search,
//                            onSubmitted: (pattern) async {
//                              app.changeLoading();
//                              if (app.search == SearchBy.PRODUCTS) {
//                                await productProvider.search(
//                                    productName: pattern);
//                                changeScreen(context, ProductSearchScreen());
//                              } else {
//                                await restaurantProvider.search(name: pattern);
//                                changeScreen(
//                                    context, RestaurantsSearchScreen());
//                              }
//                              app.changeLoading();
//                            },
//                            decoration: InputDecoration(
//                              hintText: "Find food and restaurant",
//                              border: InputBorder.none,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceAround,
//                    children: <Widget>[
//                      CustomText(
//                        text: "Search by:",
//                        color: grey,
//                        weight: FontWeight.w300,
//                      ),
//                      DropdownButton<String>(
//                        value: app.filterBy,
//                        style: TextStyle(
//                            color: primary, fontWeight: FontWeight.w300),
//                        icon: Icon(
//                          Icons.filter_list,
//                          color: primary,
//                        ),
//                        elevation: 0,
//                        onChanged: (value) {
//                          if (value == "Products") {
//                            app.changeSearchBy(newSearchBy: SearchBy.PRODUCTS);
//                          } else {
//                            app.changeSearchBy(
//                                newSearchBy: SearchBy.RESTAURANTS);
//                          }
//                        },
//                        items: <String>["Products", "Restaurants"]
//                            .map<DropdownMenuItem<String>>((String value) {
//                          return DropdownMenuItem<String>(
//                              value: value, child: Text(value));
//                        }).toList(),
//                      ),
//                    ],
//                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Carousel(
                      showIndicator: false,
                      images: [
                        Image.asset('assets/logo.png'),
                        Image.asset('assets/logo.png'),
                        Image.asset('assets/logo.png'),
                        Image.asset('assets/logo.png')
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryProvider.categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
//                              app.changeLoading();
                              await productProvider.loadProductsByCategory(
                                  categoryName:
                                      categoryProvider.categories[index].name);

                              changeScreen(
                                  context,
                                  CategoryScreen(
                                    categoryModel:
                                        categoryProvider.categories[index],
                                  ));

//                              app.changeLoading();
                            },
                            child: CategoryWidget(
                              category: categoryProvider.categories[index],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: "Featured",
                          size: 20,
                          color: grey,
                        ),
                      ],
                    ),
                  ),
                  Featured(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: "Popular restaurants",
                          size: 20,
                          color: grey,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: restaurantProvider.restaurants
                        .map((item) => GestureDetector(
                              onTap: () async {
                                app.changeLoading();

                                await productProvider.loadProductsByRestaurant(
                                    restaurantId: item.id);
                                app.changeLoading();

                                changeScreen(
                                    context,
                                    RestaurantScreen(
                                      restaurantModel: item,
                                    ));
                              },
                              child: RestaurantWidget(
                                restaurant: item,
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
    );
  }
}
