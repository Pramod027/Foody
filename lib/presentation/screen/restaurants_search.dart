import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/screen/screen_export.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:workshop/widgets/widgets_export.dart';

class RestaurantsSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor().black),
        backgroundColor: AppColor().white,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: CustomText(
          text: "Restaurants",
          size: 20.sp,
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: app.isLoading
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Loading()],
              ),
            )
          : restaurantProvider.searchedRestaurants.length < 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: AppColor().grey,
                          size: 30.w,
                        ),
                      ],
                    ),
                    kShboxH16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(
                          text: "No Restaurants Found",
                          color: AppColor().grey,
                          weight: FontWeight.w300,
                          size: 22.sp,
                        ),
                      ],
                    )
                  ],
                )
              : ListView.builder(
                  itemCount: restaurantProvider.searchedRestaurants.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () async {
                          app.changeLoading();
                          await productProvider.loadProductsByRestaurant(
                              restaurantId: restaurantProvider
                                  .searchedRestaurants[index].id);
                          app.changeLoading();

                          changeScreen(
                              context,
                              RestaurantScreen(
                                restaurantModel: restaurantProvider
                                    .searchedRestaurants[index],
                              ));
                        },
                        child: RestaurantWidget(
                            restaurant:
                                restaurantProvider.searchedRestaurants[index]));
                  }),
    );
  }
}
