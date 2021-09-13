import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';

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
            CategoryItemCard(
              image: 'assets/images/burger.png',
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.57,
              width: double.infinity,
              child: new RefreshIndicator(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryItemCard(
                      image: burgerNotifier.foodList[index].image,
                      itemName: burgerNotifier.foodList[index].name,
                      itemRating: burgerNotifier.foodList[index].rating,
                      pressed: () {
                        burgerNotifier.currentFood =
                            burgerNotifier.foodList[index];
                        Navigator.pushNamed(context, '/burgerDetails');
                      },
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
