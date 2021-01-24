//import 'package:flutter/material.dart';
//import 'package:workshop/models/product.dart';
//import 'package:workshop/screens/home/api_services.dart';
//
//class SearchProducts extends SearchDelegate {
//  @override
//  List<Widget> buildActions(BuildContext context) {
//    // TODO: implement buildActions
//    //last part of appbar usually cross icons
//    return [
//      IconButton(
//        icon: Icon(Icons.clear),
//        onPressed: () {
//          query = '';
//        },
//      )
//    ];
//  }
//
//  @override
//  Widget buildLeading(BuildContext context) {
//    //leading icon
//    return BackButton(); //inbuilt back button
//  }
//
//  @override
//  Widget buildResults(BuildContext context) {
//    Services services = Services();
//
//    return FutureBuilder(
//        future: services.getProducts(query: query),
//        builder: (context, snapshot) {
//          List<Product> productList = snapshot.data;
//
//          return !snapshot.hasData
//              ? LinearProgressIndicator()
//              : ListView.builder(
//                  itemCount: productList.length,
//                  itemBuilder: (context, index) {
//                    return ListTile(
//                      title: Text(productList[index].name),
//                    );
//                  });
//        });
//  }
//
//  @override
//  Widget buildSuggestions(BuildContext context) {
//    return Center(
//      child: Text(
//        'Search user according to their name\n(e.g"ram"for Ram',
//        textAlign: TextAlign.center,
//      ),
//    );
//  }
//}
