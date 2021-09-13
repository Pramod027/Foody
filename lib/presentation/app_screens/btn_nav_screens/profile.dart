import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_sized_box.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.brown.withOpacity(0.5)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    radius: 48.r,
                    child: SvgPicture.asset(
                      'assets/images/user.svg',
                      height: 60.w,
                      color: Colors.red.withOpacity(0.5),
                    ),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                    ),
                    right: -1,
                    bottom: 4,
                  )
                ],
              ),
            ),
          ),
          kShboxH12,
          InkWell(
            onTap: () {
//
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      title: "Profile Details",
                      descriptions:
                          "username:${authNotifier.user.email}\n name: ${authNotifier.user.displayName}\n"
                          "uid:${authNotifier.user.uid}",
                      text: "Yes",
                    );
                  });
            },
            child: CustomProfileDialogBox(
                text: 'My Account', image: 'assets/images/user.svg'),
          ),
          kShboxH12,
          InkWell(
            onTap: () {},
            child: CustomProfileDialogBox(
                text: 'Notifications',
                image: 'assets/images/notifications.svg'),
          ),
          kShboxH12,
          InkWell(
            onTap: () {},
            child: CustomProfileDialogBox(
                text: 'General', image: 'assets/images/settings.svg'),
          ),
          kShboxH12,
          InkWell(
            onTap: () {},
            child: CustomProfileDialogBox(
                text: 'Help', image: 'assets/images/information.svg'),
          ),
          kShboxH12,
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      title: "Foody App",
                      descriptions:
                          "This app lets user shop \n millions of products and manage orders from anywhere. ",
                      text: "Yes",
                    );
                  });
            },
            child: CustomProfileDialogBox(
                text: 'About us', image: 'assets/images/information.svg'),
          ),
          kShboxH12,
          InkWell(
            onTap: () {
              signout(authNotifier);
              ScopedModel.of<CartModel>(context).clearCart();
//
            },
            child: CustomProfileDialogBox(
                text: 'LogOut', image: 'assets/images/exit.svg'),
          ),
        ],
      ),
    );
  }
}
