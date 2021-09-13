import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pizza extends StatefulWidget {
  @override
  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  @override
  void initState() {
    PizzaNotifier pizzaNotifier =
        Provider.of<PizzaNotifier>(context, listen: false);
    getPizza(pizzaNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PizzaNotifier pizzaNotifier = Provider.of<PizzaNotifier>(context);

    Future<void> _refreshList() async {
      getPizza(pizzaNotifier);
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
              image: 'assets/images/pizza-slice.png',
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.57,
              width: double.infinity,
              child: new RefreshIndicator(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryItemCard(
                      image: pizzaNotifier.foodList[index].image,
                      itemName: pizzaNotifier.foodList[index].name,
                      itemRating: pizzaNotifier.foodList[index].rating,
                      pressed: () {
                        pizzaNotifier.currentFood =
                            pizzaNotifier.foodList[index];
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PizzaDetails()));
                      },
                    );
                  },
                  itemCount: pizzaNotifier.foodList.length,
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
