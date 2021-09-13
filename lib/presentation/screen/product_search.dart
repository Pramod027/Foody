import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:workshop/widgets/widgets_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor().black),
        backgroundColor: AppColor().white,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: CustomText(
          text: "Products",
          size: 20.sp,
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: productProvider.productsSearched.length < 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: AppColor().grey,
                      size: 30.w,
                    ),
                  ],
                ),
                kShboxH16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomText(
                      text: "No products Found",
                      color: AppColor().grey,
                      weight: FontWeight.w300,
                      size: 22.sp,
                    ),
                  ],
                )
              ],
            )
          : ListView.builder(
              itemCount: productProvider.productsSearched.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () async {
                      changeScreen(
                          context,
                          Details(
                              product:
                                  productProvider.productsSearched[index]));
                    },
                    child: ProductWidget(
                        product: productProvider.productsSearched[index]));
              }),
    );
  }
}
