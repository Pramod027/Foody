import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:workshop/app_api/food_api.dart';
import 'package:workshop/app_notifier/burger_notifier.dart';
import 'package:workshop/app_screens/burger/burger_detail.dart';

class Burger extends StatefulWidget {
  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  @override
  void initState() {
    BurgerNotifier burgerNotifier =
        Provider.of<BurgerNotifier>(context, listen: false);
    getBurger(burgerNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BurgerNotifier burgerNotifier = Provider.of<BurgerNotifier>(context);

    Future<void> _refreshList() async {
      getBurger(burgerNotifier);
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.save_alt,
                  color: Colors.grey,
                ),
                onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.1), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/burger.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.57,
              width: double.infinity,
              child: new RefreshIndicator(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return
//                      Shimmer.fromColors(
//                      baseColor: Colors.grey[400],
//                      highlightColor: Colors.white,
//                      direction: ShimmerDirection.ltr,
//                      period: Duration(seconds: 3),
                        Container(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                burgerNotifier.currentFood =
                                    burgerNotifier.foodList[index];
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BurgerDetails()));
                              },
                              child: Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      burgerNotifier.foodList[index].image !=
                                              null
                                          ? burgerNotifier.foodList[index].image
                                          : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          burgerNotifier.foodList[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "The Village Cafe and Resturant",
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Colors.red,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          burgerNotifier.foodList[index].rating,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ),
                    );
                  },
                  itemCount: burgerNotifier.foodList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    );
                  },
                ),
                onRefresh: _refreshList,
              ),
            )
          ]),
        )));
  }
}
