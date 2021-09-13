import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/presentation/presentation_export.dart';

import 'data/data_export.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodNotifier(),
        ),
        ChangeNotifierProvider(create: (context) => BurgerNotifier()),
        ChangeNotifierProvider(create: (context) => CartNotifier()),
        ChangeNotifierProvider(create: (context) => FastFoodNotifier()),
        ChangeNotifierProvider(create: (context) => HotDogNotifier()),
        ChangeNotifierProvider(create: (context) => PizzaNotifier()),
        // Provider<MyCart>(create: (context) => MyCart()),
      ],
      child: MyApp(
        model: CartModel(),
      ),
    ));

class MyApp extends StatelessWidget {
  final CartModel model;

  MyApp({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        allowFontScaling: true,
        builder: () => ScopedModel<CartModel>(
              model: model,
              //model:CartModel() can also be used
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  accentColor: Colors.lightBlue,
                ),
                home: Consumer<AuthNotifier>(
                  builder: (context, notifier, child) {
//          return notifier.user != null ? Landing() : Login();
                    return notifier.user != null ? NavigationPage() : Login();
                  },
                ),
              ),
            ));
  }
}
