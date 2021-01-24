import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:workshop/app_model/food.dart';

class BurgerNotifier with ChangeNotifier {
  List<Food> _foodList = [];
  Food _currentFood;

  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_foodList);

  Food get currentFood => _currentFood;

  set foodList(List<Food> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

  set currentFood(Food food) {
    _currentFood = food;
    notifyListeners();
  }

  addFood(Food food) {
    _foodList.insert(0, food);
    notifyListeners();
  }

  deleteFood(Food food) {
    _foodList.removeWhere((_food) => _food.id == food.id);
    notifyListeners();
  }
}
