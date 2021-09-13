import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:workshop/shared/shared_export.dart';

class HotDogDetails extends StatefulWidget {
  @override
  _HotDogDetailsState createState() => _HotDogDetailsState();
}

class _HotDogDetailsState extends State<HotDogDetails> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    HotDogNotifier hotDogNotifier = Provider.of<HotDogNotifier>(context);

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
                      image: hotDogNotifier.currentFood.image),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        kShboxH8,
                        ProductNameDetailsCard(
                          name: hotDogNotifier.currentFood.name,
                          price: hotDogNotifier.currentFood.price,
                          description: hotDogNotifier.currentFood.description,
                        ),
                        kShboxH12,
                        ExpandablePanel(
                          header: Text('Ingredients',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              )),
                          expanded: SizedBox(
                            height: 40.h,
                            child: ListView.builder(
                              itemCount: hotDogNotifier
                                  .currentFood.subIngredients.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, int index) {
                                return ExpandablePannelWidget(
                                  ingredientsName: hotDogNotifier
                                      .currentFood.subIngredients[index]
                                      .toString(),
                                );
                              },
                            ),
                          ),
                        ),
                        kShboxH12,
                        ReviewWithRating(
                          rating:
                              double.parse(hotDogNotifier.currentFood.rating),
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
                              model.addProduct(hotDogNotifier.currentFood);
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
