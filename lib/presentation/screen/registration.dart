import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/shared_export.dart';
import 'package:workshop/widgets/widgets_export.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: AppColor().white,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "images/logo.png",
                        width: 100.w,
                        height: 100.h,
                      ),
                    ],
                  ),
                  kShboxH40,
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor().grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: TextFormField(
                          controller: authProvider.name,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username",
                              icon: Icon(Icons.person)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor().grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: TextFormField(
                          controller: authProvider.email,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Emails",
                              icon: Icon(Icons.email)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor().grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: TextFormField(
                          controller: authProvider.password,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              icon: Icon(Icons.lock)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: GestureDetector(
                      onTap: () async {
                        print("BTN CLICKED!!!!");
                        print("BTN CLICKED!!!!");
                        print("BTN CLICKED!!!!");
                        print("BTN CLICKED!!!!");
                        print("BTN CLICKED!!!!");
                        print("BTN CLICKED!!!!");

                        if (!await authProvider.signUp()) {
                          _key.currentState.showSnackBar(
                              SnackBar(content: Text("Resgistration failed!")));
                          return;
                        }
                        categoryProvider.loadCategories();
                        restaurantProvider.loadSingleRestaurant();
                        productProvider.loadProducts();
                        authProvider.clearController();
                        changeScreenReplacement(context, Home());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor().red,
                            border: Border.all(color: AppColor().grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomText(
                                text: "Resgister",
                                color: AppColor().white,
                                size: 22.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeScreen(context, LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(
                          text: "login here here",
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
