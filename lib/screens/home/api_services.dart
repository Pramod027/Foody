//
//import 'dart:convert';
//
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:http/http.dart' as http;
//import 'package:workshop/models/product.dart';
//
//class Services {
//  List data = [];
//  var response;
//
//  Iterable<Product> productList = [];
//  String url =
//      'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
//
//  Future<List<Product>> getProducts({String id, String query}) async {
//    response = await http.get(url);
//    data = json.decode(response.body);
//
//    productList = data.map((e) => Product.fromJson(e)).toList();
//
//    //filter user-id
//    if (id != null) {
//      productList = productList
//          .where((element) => element.id.toString().contains(id))
//          .toList();
//    }
//    //search user name
//    if (query != null) {
//      productList = productList
//          .where((element) => element.name.toLowerCase().contains(query))
//          .toList();
//    }
//    return productList;
//  }
//}
