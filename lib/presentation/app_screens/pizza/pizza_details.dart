import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/shared_export.dart';

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
                  CategoryItemDetailImage(
                    image: pizzaNotifier.currentFood.image,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        kShboxH8,
                        ProductNameDetailsCard(
                          name: pizzaNotifier.currentFood.name,
                          price: pizzaNotifier.currentFood.price,
                          description: pizzaNotifier.currentFood.description,
                        ),
                        kShboxH8,
                        ExpandablePanel(
                          header: Text('Ingredients',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              )),
                          expanded: SizedBox(
                            height: 40.h,
                            child: ListView.builder(
                              itemCount: pizzaNotifier
                                  .currentFood.subIngredients.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, int index) {
                                return ExpandablePannelWidget(
                                  ingredientsName: pizzaNotifier
                                      .currentFood.subIngredients[index]
                                      .toString(),
                                );
                              },
                            ),
                          ),
                        ),
                        kShboxH8,
                        ReviewWithRating(
                          rating:
                              double.parse(pizzaNotifier.currentFood.rating),
                        ),
                        kShboxH20,
                        SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: FlatButton(
                            color: Color(0xFF81C784),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            onPressed: () async {
                              model.addProduct(pizzaNotifier.currentFood);
                            },
                            child: Text('Add To Basket',
                                style: AppStyles().subIngridents),
                          ),
                        ),
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
