import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:workshop/shared/shared_export.dart';

class FoodDetail extends StatefulWidget {
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
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
              Navigator.pushNamed(context, '/totalPrice');
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
                    height: 160.h,
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
                        foodNotifier.currentFood.image != null
                            ? foodNotifier.currentFood.image
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
                        kShboxH8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              foodNotifier.currentFood.name,
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '\$${foodNotifier.currentFood.price}',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        kShboxH8,
                        ExpandablePanel(
                          header: Text(
                            'Product Details',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          expanded: Text(
                            foodNotifier.currentFood.description,
                            style: AppStyles().blac54,
                            softWrap: true,
                          ),
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
                              itemCount: foodNotifier
                                  .currentFood.subIngredients.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, int index) {
                                return SizedBox(
                                  height: 30.h,
                                  child: Row(
                                    children: [
                                      Chip(
                                        padding: EdgeInsets.all(8.0),
                                        backgroundColor:
                                            Colors.red.withOpacity(0.2),
                                        label: Text(
                                          foodNotifier
                                              .currentFood.subIngredients[index]
                                              .toString(),
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                      ),
                                      kShboxH8,
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        kShboxH8,
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
                              size: 16.w,
                              rating:
                                  double.parse(foodNotifier.currentFood.rating),
                              color: Colors.redAccent,
                              borderColor: Colors.red,
                              allowHalfRating: false,
                            ),
                          ],
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
                              model.addProduct(foodNotifier.currentFood);
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
