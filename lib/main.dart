////import 'package:firebase_core/firebase_core.dart';
////import 'package:flutter/material.dart';
////import 'package:flutter_riverpod/all.dart';
////import 'package:workshop/screens/sign_in/login.dart';
////import 'package:workshop/services/auth_service.dart';
////
////Future<void> main() async {
////  WidgetsFlutterBinding.ensureInitialized();
////  await Firebase.initializeApp();
////  runApp(ProviderScope(child: MyApp()));
////}
////
////class MyApp extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    return MaterialApp(
////      debugShowCheckedModeBanner: false,
////      home: LoginScreen(),
////    );
////  }
////}
//
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:workshop/providers/app.dart';
//import 'package:workshop/providers/category.dart';
//import 'package:workshop/providers/product.dart';
//import 'package:workshop/providers/restaurant.dart';
//import 'package:workshop/providers/user.dart';
//import 'package:workshop/screen/home.dart';
//import 'package:workshop/screen/login.dart';
//import 'package:workshop/screen/splash.dart';
//import 'package:firebase_core/firebase_core.dart';
//
//void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
//  runApp(MultiProvider(
//      providers: [
//        ChangeNotifierProvider.value(value: AppProvider()),
//        ChangeNotifierProvider.value(value: UserProvider.initialize()),
//        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
//        ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
//        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
//      ],
//      child: MaterialApp(
//          debugShowCheckedModeBanner: false,
//          title: 'Food App',
//          theme: ThemeData(
//            primarySwatch: Colors.red,
//          ),
//          home: ScreensController())));
//}
//
//class ScreensController extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final auth = Provider.of<UserProvider>(context);
//    switch (auth.status) {
//      case Status.Uninitialized:
//        return Splash();
//      case Status.Unauthenticated:
//      case Status.Authenticating:
//        return LoginScreen();
//      case Status.Authenticated:
//        return Home();
//      default:
//        return LoginScreen();
//    }
//  }
//}

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:workshop/app_model/food.dart';
import 'package:workshop/app_model/user.dart';
import 'package:workshop/app_notifier/auth_notifier.dart';
import 'package:workshop/app_notifier/burger_notifier.dart';
import 'package:workshop/app_notifier/cart_notifier.dart';
import 'package:workshop/app_notifier/fast_food_notifier.dart';
import 'package:workshop/app_notifier/food_notifier.dart';
import 'package:workshop/app_notifier/hotdog_notifier.dart';
import 'package:workshop/app_notifier/pizza_notifier.dart';
import 'package:workshop/app_screens/btn_nav_screens/feed.dart';
import 'package:workshop/app_screens/btn_nav_screens/nav_page.dart';
import 'package:workshop/app_screens/login.dart';
import 'package:workshop/app_screens/onboarding_screen/intro_page.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/cart_app/cart_model.dart';

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
    return ScopedModel<CartModel>(
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
    );
  }
}
