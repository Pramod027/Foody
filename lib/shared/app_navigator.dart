import 'package:flutter/material.dart';
import 'package:workshop/presentation/presentation_export.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case '/totalPrice':
        return MaterialPageRoute(builder: (_) => TotalPrice());
        break;
      case '/burger':
        return MaterialPageRoute(builder: (_) => Burger());
        break;
      case '/fastFood':
        return MaterialPageRoute(builder: (_) => FastFood());
        break;
      case '/hotDoc':
        return MaterialPageRoute(builder: (_) => HotDog());
        break;
      case '/pizza':
        return MaterialPageRoute(builder: (_) => Pizza());
        break;
      case '/foodDetails':
        return MaterialPageRoute(builder: (_) => FoodDetail());
        break;
      case '/burgerDetails':
        return MaterialPageRoute(builder: (_) => BurgerDetails());
        break;
      case '/fastFoodDetails':
        return MaterialPageRoute(builder: (_) => FastFoodDetails());
        break;
      case '/hotdogDetails':
        return MaterialPageRoute(builder: (_) => HotDogDetails());
        break;
      default:
        return null;
    }
  }
}
