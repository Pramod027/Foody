import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:workshop/app_api/food_api.dart';
import 'package:workshop/app_model/food.dart';
import 'package:workshop/app_notifier/burger_notifier.dart';
import 'package:workshop/app_notifier/pizza_notifier.dart';
import 'package:workshop/app_screens/pizza/pizza.dart';
import 'package:workshop/cart_app/cart_model.dart';
import 'package:workshop/cart_app/total_price.dart';

class PizzaDetails extends StatefulWidget {
  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    PizzaNotifier pizzaNotifier = Provider.of<PizzaNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFECEFF1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.grey.withOpacity(0.5),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TotalPrice()));
            },
          )
        ],
        // title: Text(foodNotifier.currentFood.name),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: ScopedModelDescendant<CartModel>(
            builder: (BuildContext context, child, model) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(33),
                          bottomRight: Radius.circular(33),
                        ),
                        color: Color(0xFFFECEFF1)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.network(
                        pizzaNotifier.currentFood.image != null
                            ? pizzaNotifier.currentFood.image
                            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              pizzaNotifier.currentFood.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '\$${pizzaNotifier.currentFood.price}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ExpandablePanel(
                          header: Text(
                            'Product Details',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          expanded: Text(
                            pizzaNotifier.currentFood.description,
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ExpandablePanel(
                          header: Text('Ingredients',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              )),
                          expanded: SizedBox(
                            height: 40,
                            child: ListView.builder(
                              itemCount: pizzaNotifier
                                  .currentFood.subIngredients.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, int index) {
                                return SizedBox(
                                  height: 30,
                                  child: Row(
                                    children: [
                                      Chip(
                                        padding: EdgeInsets.all(8.0),
                                        backgroundColor:
                                            Colors.red.withOpacity(0.2),
                                        label: Text(
                                          pizzaNotifier
                                              .currentFood.subIngredients[index]
                                              .toString(),
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Review',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            SmoothStarRating(
                              starCount: 5,
                              isReadOnly: false, //for user update
                              size: 16,
                              rating: double.parse(
                                  pizzaNotifier.currentFood.rating),
                              color: Colors.redAccent,
                              borderColor: Colors.red,
                              allowHalfRating: false,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: FlatButton(
                            color: Color(0xFF81C784),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            onPressed: () async {
                              model.addProduct(pizzaNotifier.currentFood);
                            },
                            child: Text(
                              'Add To Basket',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
