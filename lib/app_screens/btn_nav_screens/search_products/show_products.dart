import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/app_notifier/food_notifier.dart';
import 'package:workshop/app_screens/btn_nav_screens/search_products/full_products_details.dart';
import 'package:workshop/app_screens/detail.dart';
import 'package:workshop/screen/details.dart';

class ShowProducts extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return StreamBuilder(
      stream: Firestore.instance.collection('Foods').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        final results = snapshot.data.documents.where((element) =>
            element.data['name'].toString().toLowerCase().contains(query));
        return GridView.count(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            primary: false,
            shrinkWrap: true,
            children: results.map<Widget>((data) {
//              int index = results;
              return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GestureDetector(
                            onTap: () {
                              foodNotifier.currentFood =
                                  foodNotifier.foodList[0];
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return FoodDetail();
                              }));
                            },
                            child: Image.network(
                              data['image'] != null
                                  ? data['image']
                                  : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                              height: 90,
                              width: 90,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data['name'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ))
                      ],
                    ),
                  ));
            }).toList());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('Foods').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new CircularProgressIndicator();

        final results = snapshot.data.documents.where((DocumentSnapshot a) =>
            a.data['name'].toString().toLowerCase().contains(query));
        return ListView(
            children: results.map<Widget>((a) {
          return Card(
            child: ListTile(
//                        leading: Image.network(
//                          a['image'] != null
//                              ? a['image']
//                              : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
//                          height: 90,
//                          width: 90,
//                          fit: BoxFit.fill,
//                        ),
              leading: Text(a.data['name'].toString()),
            ),
          );
        }).toList());
      },
    );
  }
}
