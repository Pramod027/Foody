import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductNameDetailsCard extends StatelessWidget {
  final String name;
  final String price;
  final String description;

  const ProductNameDetailsCard(
      {Key key, this.name, this.price, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppStyles().body18,
            ),
            Text('\$$price', style: AppStyles().body18),
          ],
        ),
        kShboxH8,
        ExpandablePanel(
          header: Text('Product Details', style: AppStyles().body18),
          expanded: Text(
            description,
            style: AppStyles().blac54,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
