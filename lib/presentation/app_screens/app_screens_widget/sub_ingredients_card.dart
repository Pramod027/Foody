import 'package:flutter/material.dart';
import 'package:workshop/shared/app_styles.dart';

class SubIngredientsCard extends StatelessWidget {
  final List subIngridents;

  const SubIngredientsCard({Key key, this.subIngridents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(8),
      crossAxisCount: 3,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      children: subIngridents
          .map(
            (ingredient) => Card(
              color: Colors.grey,
              child: Center(
                child: Text(ingredient, style: AppStyles().subIngridents),
              ),
            ),
          )
          .toList(),
    );
  }
}
