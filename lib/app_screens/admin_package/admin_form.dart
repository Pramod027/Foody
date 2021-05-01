import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:workshop/app_api/food_api.dart';
import 'package:workshop/app_model/food.dart';
import 'package:workshop/app_notifier/burger_notifier.dart';
import 'package:workshop/app_notifier/food_notifier.dart';
import 'package:workshop/app_screens/food_form.dart';
import 'package:workshop/cart_app/cart_model.dart';
import 'package:workshop/cart_app/total_price.dart';

class AdminProductDetails extends StatefulWidget {
  @override
  _AdminProductDetailsState createState() => _AdminProductDetailsState();
}

class _AdminProductDetailsState extends State<AdminProductDetails> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    _onFoodDeleted(Food food) {
      Navigator.pop(context);
      foodNotifier.deleteFood(food);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.grey.withOpacity(0.5),
        ),

        // title: Text(foodNotifier.currentFood.name),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: ScopedModelDescendant<CartModel>(
            builder: (BuildContext context, child, model) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Image.network(
                        foodNotifier.currentFood.image != null
                            ? foodNotifier.currentFood.image
                            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    foodNotifier.currentFood.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'button1',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return FoodForm(
                    isUpdating: true,
                  );
                }),
              );
            },
            child: Icon(Icons.edit),
            foregroundColor: Colors.white,
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'button2',
            onPressed: () =>
                deleteFood(foodNotifier.currentFood, _onFoodDeleted),
            child: Icon(Icons.delete),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
