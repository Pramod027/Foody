import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:workshop/app_api/food_api.dart';
import 'package:workshop/app_notifier/auth_notifier.dart';
import 'package:workshop/app_notifier/food_notifier.dart';
import 'file:///C:/Users/DELL/FlutterProjects/workshop/lib/app_screens/btn_nav_screens/search_products/show_products.dart';
import 'package:workshop/app_screens/burger/burger.dart';
import 'package:workshop/app_screens/detail.dart';
import 'package:workshop/app_screens/fastfood/fast_food.dart';
import 'package:workshop/app_screens/food_form.dart';
import 'package:workshop/app_screens/hotdog/hotdog.dart';

import 'package:workshop/app_screens/pizza/pizza.dart';
import 'package:workshop/cart_app/cart_model.dart';
import 'package:workshop/cart_app/total_price.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool loading = true;
  double initialRating;

  @override
  void initState() {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    initialRating = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    Future<void> _refreshList() async {
      getFoods(foodNotifier);
    }

    print("building Feed");
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Foody',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontFamily: 'Dancing'),
          ),
        ),

//        title: Text(
//          authNotifier.user != null ? authNotifier.user.displayName : "Feed",
//        ),
//        actions: <Widget>[
//          // action button
//          FlatButton(
//            onPressed: () => signout(authNotifier),
//            child: Text(
//              "Logout",
//              style: TextStyle(fontSize: 20, color: Colors.white),
//            ),
//          ),
//        ],
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                showSearch(context: context, delegate: ShowProducts());
              }),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TotalPrice()));
                  },
                ),
                Positioned(
                  top: 6,
                  right: 2,
                  child: Image.asset(
                    ScopedModel.of<CartModel>(context, rebuildOnChange: true)
                                .cart
                                .length ==
                            0
                        ? 'assets/images/red_circle.png'
                        : 'assets/images/green_circle.png',
                    height: 10,
                    width: 10,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFFECEFF1)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Image.asset(
                      'assets/images/burger.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Positioned(
                    top: 26,
                    left: 110,
                    child: Text(
                      'Order Fresh Foods',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Positioned(
                    top: 45,
                    left: 120,
                    child: Text(
                      'Get Up To 40% OFF',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        color: Color(0xFF81C784),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -30,
                    right: -50,
                    child: Image.asset(
                      'assets/images/banner.png',
                      height: 80,
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    right: -20,
                    child: Image.asset(
                      'assets/images/banner3.png',
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Burger()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                          height: 60,
                          width: 60,
                          child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/images/burger.svg',
                              height: 25,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Burger',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FastFood()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                          height: 60,
                          width: 60,
                          child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/fast-food.svg',
                                height: 25,
                                color: Colors.red,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Fast food',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HotDog()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                          height: 60,
                          width: 60,
                          child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/hotdog.svg',
                                height: 25,
                                color: Colors.red,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Hotdog',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Pizza()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                          height: 60,
                          width: 60,
                          child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/pizza-slice.svg',
                                height: 25,
                                color: Colors.red,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Pizza',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Featured',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Container(
              height: 190,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        height: 190,
                        width: 175,
//                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[300],
                                offset: Offset(-2, -1),
                                blurRadius: 5),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 10.0),
                              child: Container(
                                width: 130,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    foodNotifier.foodList[index].image != null
                                        ? foodNotifier.foodList[index].image
                                        : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    foodNotifier.foodList[index].name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {})
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        '${foodNotifier.foodList[index].rating}',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 14.0),
                                      ),
                                    ),
                                    SmoothStarRating(
                                      starCount: 5,
                                      isReadOnly: false, //for user update
                                      size: 16,
                                      rating: double.parse(
                                          foodNotifier.foodList[index].rating),
                                      color: Colors.redAccent,
                                      borderColor: Colors.red,
                                      allowHalfRating: false,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Text(
                                    '\$${foodNotifier.foodList[index].price.toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                )
//                              Text(
//                                foodNotifier.foodList[index].category,
//                                style: TextStyle(color: Colors.black),
//                              ),
                              ],
                            )
                          ],
                        ),

//                    child: ListTile(
//                      leading: Image.network(
//                        foodNotifier.foodList[index].image != null
//                            ? foodNotifier.foodList[index].image
//                            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
//                        width: 120,
//                        fit: BoxFit.fitWidth,
//                      ),
//                      title: Text(foodNotifier.foodList[index].name),
//                      subtitle: Text(foodNotifier.foodList[index].category),
//                      onTap: () {
//                        foodNotifier.currentFood = foodNotifier.foodList[index];
//                        Navigator.of(context).push(
//                            MaterialPageRoute(builder: (BuildContext context) {
//                          return FoodDetail();
//                        }));
//                      },
//                    ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  );
                },
                itemCount: foodNotifier.foodList.length,

//                separatorBuilder: (BuildContext context, int index) {
//                  return Divider(
//                    color: Colors.black,
//                  );
//                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recommend',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                )
              ],
            ),
            Container(
              height: 180,
              child: new RefreshIndicator(
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 15),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          height: 190,
                          width: 175,
//                        margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(-2, -1),
                                  blurRadius: 5),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0, top: 10.0),
                                child: Container(
                                  width: 130,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: InkWell(
                                      onTap: () {
                                        foodNotifier.currentFood =
                                            foodNotifier.foodList[index];
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return FoodDetail();
                                        }));
                                      },
                                      child: Image.network(
                                        foodNotifier.foodList[index].image !=
                                                null
                                            ? foodNotifier.foodList[index].image
                                            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      foodNotifier.foodList[index].name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {})
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '${foodNotifier.foodList[index].rating}',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      SmoothStarRating(
                                        starCount: 5,
                                        isReadOnly: false, //for user update
                                        size: 16,
                                        color: Colors.redAccent,
                                        borderColor: Colors.red,
                                        rating: double.parse(foodNotifier
                                            .foodList[index].rating),
                                        allowHalfRating: false,
                                      ),
//                                      SizedBox(
//                                        width: 2,
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.red,
//                                        size: 14,
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.red,
//                                        size: 14,
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.red,
//                                        size: 14,
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.red,
//                                        size: 14,
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.grey,
//                                        size: 14,
//                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Text(
                                      '\$${foodNotifier.foodList[index].price}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )
//                              Text(
//                                foodNotifier.foodList[index].category,
//                                style: TextStyle(color: Colors.black),
//                              ),
                                ],
                              )
                            ],
                          ),

//                    child: ListTile(
//                      leading: Image.network(
//                        foodNotifier.foodList[index].image != null
//                            ? foodNotifier.foodList[index].image
//                            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
//                        width: 120,
//                        fit: BoxFit.fitWidth,
//                      ),
//                      title: Text(foodNotifier.foodList[index].name),
//                      subtitle: Text(foodNotifier.foodList[index].category),
//                      onTap: () {
//                        foodNotifier.currentFood = foodNotifier.foodList[index];
//                        Navigator.of(context).push(
//                            MaterialPageRoute(builder: (BuildContext context) {
//                          return FoodDetail();
//                        }));
//                      },
//                    ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    );
                  },
                  itemCount: foodNotifier.foodList.length,
//                separatorBuilder: (BuildContext context, int index) {
//                  return Divider(
//                    color: Colors.black,
//                  );
//                },
                ),
                onRefresh: _refreshList,
              ),
            ),
          ],
        ),
      ),

//   Lastly Removed
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          foodNotifier.currentFood = null;
//          Navigator.of(context).push(
//            MaterialPageRoute(builder: (BuildContext context) {
//              return FoodForm(
//                isUpdating: false,
//              );
//            }),
//          );
//        },
//        child: Icon(Icons.add),
//        foregroundColor: Colors.white,
//      ),
    );
  }
}
