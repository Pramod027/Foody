import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotDog extends StatefulWidget {
  @override
  _HotDogState createState() => _HotDogState();
}

class _HotDogState extends State<HotDog> {
  @override
  void initState() {
    HotDogNotifier hotDogNotifier =
        Provider.of<HotDogNotifier>(context, listen: false);
    getHotDog(hotDogNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HotDogNotifier hotDogNotifier = Provider.of<HotDogNotifier>(context);

    Future<void> _refreshList() async {
      getHotDog(hotDogNotifier);
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
            CategoryItemImage(
              image: 'assets/images/hotdog.png',
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.57,
              width: double.infinity,
              child: new RefreshIndicator(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryItemCard(
                      image: hotDogNotifier.foodList[index].image,
                      itemName: hotDogNotifier.foodList[index].name,
                      itemRating: hotDogNotifier.foodList[index].rating,
                      pressed: () {
                        hotDogNotifier.currentFood =
                            hotDogNotifier.foodList[index];
                        Navigator.pushNamed(context, '/hotdogDetails');
                      },
                    );
                  },
                  itemCount: hotDogNotifier.foodList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
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
