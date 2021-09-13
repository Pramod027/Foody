import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FastFood extends StatefulWidget {
  @override
  _FastFoodState createState() => _FastFoodState();
}

class _FastFoodState extends State<FastFood> {
  @override
  void initState() {
    FastFoodNotifier fastFoodNotifier =
        Provider.of<FastFoodNotifier>(context, listen: false);
    getFastFood(fastFoodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FastFoodNotifier fastFoodNotifier = Provider.of<FastFoodNotifier>(context);

    Future<void> _refreshList() async {
      getFastFood(fastFoodNotifier);
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
            CategoryItemCard(
              image: 'assets/images/fast_foods.png',
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.57,
              width: double.infinity,
              child: new RefreshIndicator(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryItemCard(
                      image: fastFoodNotifier.foodList[index].image,
                      itemName: fastFoodNotifier.foodList[index].name,
                      itemRating: fastFoodNotifier.foodList[index].rating,
                      pressed: () {
                        fastFoodNotifier.currentFood =
                            fastFoodNotifier.foodList[index];

                        Navigator.pushNamed(context, '/fastFoodDetails');
                      },
                    );
                  },
                  itemCount: fastFoodNotifier.foodList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.h),
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
