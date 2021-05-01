import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String id;
  String name;
  String category;
  String rating;
  String price;
  String image;
  String description;
  List subIngredients = [];
  Timestamp createdAt;
  Timestamp updatedAt;
  int qty = 1;

  Food();

  Food.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    image = data['image'];
    subIngredients = data['subIngredients'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
    price = data['price'];
    rating = data['rating'];
    description = data['description'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'subIngredients': subIngredients,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'price': price,
      'rating': rating,
      'description': description,
    };
  }
}
