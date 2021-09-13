import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:workshop/shared/app_styles.dart';
import '../app_screens_widget/custom_category_widget.dart';
import '../app_screens_widget/feed_screen_card.dart';
import 'drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            style: AppStyles().appName,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 24.h,
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
                    Navigator.pushNamed(context, '/totalPrice');
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
                    height: 10.h,
                    width: 10.w,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeedScreenCard(),
            kShboxH12,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCategoryWidget(
                      text: 'Burger',
                      image: 'assets/images/burger.svg',
                      pressed: () {
                        Navigator.pushNamed(context, '/burger');
                      }),
                  CustomCategoryWidget(
                      text: 'Fast food',
                      image: 'assets/images/fast-food.svg',
                      pressed: () {
                        Navigator.pushNamed(context, '/fastFood');
                      }),
                  CustomCategoryWidget(
                      text: 'Hotdog',
                      image: 'assets/images/hotdog.svg',
                      pressed: () {
                        Navigator.pushNamed(context, '/hotDog');
                      }),
                  CustomCategoryWidget(
                      text: 'Pizza',
                      image: 'assets/images/pizza-slice.svg',
                      pressed: () {
                        Navigator.pushNamed(context, '/pizza');
                      }),
                ],
              ),
            ),
            CustomTopicWidget(topic: 'Featured'),
            Container(
              height: 190,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return FeaturedItemsCard(
                    pressed: () {},
                    featuredItemImage: foodNotifier.foodList[index].image,
                    featuredItemName: foodNotifier.foodList[index].name,
                    price: foodNotifier.foodList[index].price.toString(),
                    rating: foodNotifier.foodList[index].rating,
                    ratingValue:
                        double.parse(foodNotifier.foodList[index].rating),
                  );
                },
                itemCount: foodNotifier.foodList.length,
              ),
            ),
            CustomTopicWidget(topic: 'Recommend'),
            Container(
              height: 180.h,
              child: new RefreshIndicator(
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 15.w),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return FeaturedItemsCard(
                      featuredItemImage: foodNotifier.foodList[index].image,
                      featuredItemName: foodNotifier.foodList[index].name,
                      price: foodNotifier.foodList[index].price.toString(),
                      rating: foodNotifier.foodList[index].rating,
                      ratingValue: double.parse(
                        foodNotifier.foodList[index].rating,
                      ),
                      pressed: () {
                        foodNotifier.currentFood = foodNotifier.foodList[index];

                        Navigator.pushNamed(context, '/foodDetails');
                      },
                    );
//
                  },
                  itemCount: foodNotifier.foodList.length,
//
                ),
                onRefresh: _refreshList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
