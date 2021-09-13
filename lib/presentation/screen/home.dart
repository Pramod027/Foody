import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:workshop/widgets/widgets_export.dart';
import 'category.dart';

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
          color: AppColor().black,
          weight: FontWeight.bold,
        ),
        actions: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: _folded ? 56.w : 200.w,
            height: 56.h,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              // boxShadow: kElevationToShadow[6],
            ),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 16.w),
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
                AniminatedSearchCard(),
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
      backgroundColor: AppColor().white,
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
                  SizedBox(
                    height: 100.h,
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
                  kShboxH12,
                  Container(
                    height: 100.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryProvider.categories.length,
                        shrinkWrap: true,
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
                          size: 20.sp,
                          color: AppColor().grey,
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
                          size: 20.sp,
                          color: AppColor().grey,
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
