import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/app_screens/btn_nav_screens/search_products/search_product_widgets.dart/product_name_details_card.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullProductsDetails extends StatefulWidget {
  final Food data;

  const FullProductsDetails({Key key, this.data}) : super(key: key);
  @override
  _FullProductsDetailsState createState() => _FullProductsDetailsState();
}

class _FullProductsDetailsState extends State<FullProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //key: _key,
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
                    image: widget.data.image,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        kShboxH8,
                        ProductNameDetailsCard(
                          name: widget.data.name,
                          price: widget.data.price,
                          description: widget.data.description,
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
                              itemCount: widget.data.subIngredients.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, int index) {
                                return ExpandablePannelWidget(
                                    ingredientsName: widget
                                        .data.subIngredients[index]
                                        .toString());
                              },
                            ),
                          ),
                        ),
                        kShboxH8,
                        ReviewWithRating(
                          rating: double.parse(widget.data.rating),
                        ),
                        kShboxH20,
                        AddToBasketCard(),
                      ],
                    ),
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
          kShboxH20
        ],
      ),
    );
  }
}
