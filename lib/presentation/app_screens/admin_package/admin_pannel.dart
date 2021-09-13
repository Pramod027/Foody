import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/presentation_export.dart';

class AdminPannel extends StatefulWidget {
  @override
  _AdminPannelState createState() => _AdminPannelState();
}

class _AdminPannelState extends State<AdminPannel> {
  bool loading = true;
  double initialRating;

  @override
  void initState() {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    initialRating = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    Future<void> _refreshList() async {
      getFoods(foodNotifier);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AdminLogin()));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 5),
          height: MediaQuery.of(context).size.height,
          child: new RefreshIndicator(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 5),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      height: 190,
                      width: 165,
//                        margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(-2, -1),
                              blurRadius: 5),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 125,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () {
                                  foodNotifier.currentFood =
                                      foodNotifier.foodList[index];
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return AdminProductDetails();
                                  }));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Image.network(
                                    foodNotifier.foodList[index].image != null
                                        ? foodNotifier.foodList[index].image
                                        : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  foodNotifier.foodList[index].name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {})
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '${foodNotifier.foodList[index].rating}',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14.0),
                                    ),
                                  ),
                                  SmoothStarRating(
                                    starCount: 5,
                                    isReadOnly: false, //for user update
                                    size: 16,
                                    color: Colors.redAccent,
                                    borderColor: Colors.red,
                                    rating: double.parse(
                                        foodNotifier.foodList[index].rating),
                                    allowHalfRating: false,
                                  ),
//                                      SizedBox(
//                                        width: 2,
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.red,
//                                        size: 14,
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.red,
//                                        size: 14,
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.red,
//                                        size: 14,
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.red,
//                                        size: 14,
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.grey,
//                                        size: 14,
//                                      ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Text(
                                  '\$${foodNotifier.foodList[index].price}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              )
//                              Text(
//                                foodNotifier.foodList[index].category,
//                                style: TextStyle(color: Colors.black),
//                              ),
                            ],
                          )
                        ],
                      ),

//                    child: ListTile(
//                      leading: Image.network(
//                        foodNotifier.foodList[index].image != null
//                            ? foodNotifier.foodList[index].image
//                            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
//                        width: 120,
//                        fit: BoxFit.fitWidth,
//                      ),
//                      title: Text(foodNotifier.foodList[index].name),
//                      subtitle: Text(foodNotifier.foodList[index].category),
//                      onTap: () {
//                        foodNotifier.currentFood = foodNotifier.foodList[index];
//                        Navigator.of(context).push(
//                            MaterialPageRoute(builder: (BuildContext context) {
//                          return FoodDetail();
//                        }));
//                      },
//                    ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                );
              },
              itemCount: foodNotifier.foodList.length,
//                separatorBuilder: (BuildContext context, int index) {
//                  return Divider(
//                    color: Colors.black,
//                  );
//                },
            ),
            onRefresh: _refreshList,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          foodNotifier.currentFood = null;
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return FoodForm(
                isUpdating: false,
              );
            }),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
    );
  }
}
