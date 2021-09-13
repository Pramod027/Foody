import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_styles.dart';

class BurgerDetails extends StatefulWidget {
  @override
  _BurgerDetailsState createState() => _BurgerDetailsState();
}

class _BurgerDetailsState extends State<BurgerDetails> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('fast_food');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return NewScreen(
        payload: payload,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    BurgerNotifier burgerNotifier = Provider.of<BurgerNotifier>(context);

    _onFoodDeleted(Food food) {
      Navigator.pop(context);
      burgerNotifier.deleteFood(food);
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
                    image: burgerNotifier.currentFood.image,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        kShboxH8,
                        ProductNameDetailsCard(
                          name: burgerNotifier.currentFood.name,
                          price: burgerNotifier.currentFood.price,
                          description: burgerNotifier.currentFood.description,
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
                              itemCount: burgerNotifier
                                  .currentFood.subIngredients.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, int index) {
                                return ExpandablePannelWidget(
                                  ingredientsName: burgerNotifier
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
                              double.parse(burgerNotifier.currentFood.rating),
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
                              model.addProduct(burgerNotifier.currentFood);
                              showNotification();
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

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Foody', 'Item added in the cart', platform,
        payload: 'Welcome to the Local Notification demo ');
  }
}

class NewScreen extends StatelessWidget {
  String payload;

  NewScreen({
    @required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(payload),
      ),
    );
  }
}
