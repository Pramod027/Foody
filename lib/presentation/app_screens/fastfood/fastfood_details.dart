import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_styles.dart';

class FastFoodDetails extends StatefulWidget {
  @override
  _FastFoodDetailsState createState() => _FastFoodDetailsState();
}

class _FastFoodDetailsState extends State<FastFoodDetails> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FastFoodNotifier fastFoodNotifier = Provider.of<FastFoodNotifier>(context);

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
                    image: fastFoodNotifier.currentFood.image,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        kShboxH8,
                        ProductNameDetailsCard(
                          name: fastFoodNotifier.currentFood.name,
                          price: fastFoodNotifier.currentFood.price,
                          description: fastFoodNotifier.currentFood.description,
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
                              itemCount: fastFoodNotifier
                                  .currentFood.subIngredients.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, int index) {
                                return ExpandablePannelWidget(
                                  ingredientsName: fastFoodNotifier
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
                              double.parse(fastFoodNotifier.currentFood.rating),
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: FlatButton(
                            color: Color(0xFF81C784),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            onPressed: () async {
                              model.addProduct(fastFoodNotifier.currentFood);
                            },
                            child: Text('Add To Basket',
                                style: AppStyles().subIngridents),
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
