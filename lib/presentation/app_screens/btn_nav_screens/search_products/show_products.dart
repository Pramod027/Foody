import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/data_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_styles.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            primary: false,
            shrinkWrap: true,
            children: results.map<Widget>((data) {
              int index = snapshot.data.documents.length;
              print('The items are:$index');
              return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  elevation: 2.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GestureDetector(
                            onTap: () {
                              foodNotifier.currentFood =
                                  foodNotifier.foodList[2];

                              Navigator.pushNamed(context, '/foodDetails');
                            },
                            child: Image.network(
                              data['image'] != null
                                  ? data['image']
                                  : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                              height: 90.h,
                              width: 90.w,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data['name'],
                                  style: AppStyles().bodyMedium16),
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
              leading: Text(a.data['name'].toString()),
            ),
          );
        }).toList());
      },
    );
  }
}
