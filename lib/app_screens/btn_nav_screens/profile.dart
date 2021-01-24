import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/app_api/food_api.dart';
import 'package:workshop/app_notifier/auth_notifier.dart';
import 'package:workshop/app_screens/login.dart';
import 'package:workshop/cart_app/cart_model.dart';

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
//          onPressed: () {
//            Navigator.pop(context);
//          },
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
                    radius: 50.0,
                    child: SvgPicture.asset(
                      'assets/images/user.svg',
                      height: 70.0,
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
                    right: 0,
                    bottom: 6,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('${authNotifier.user.email}'),
              ));
            },
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(0.1)),
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/images/user.svg',
                  color: Colors.red,
                  height: 30.0,
                ),
                title: Text('My Account'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/images/notifications.svg',
                  color: Colors.red,
                  height: 30.0,
                ),
                title: Text('Notifications'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/images/settings.svg',
                  color: Colors.red,
                  height: 30.0,
                ),
                title: Text('Settings'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/images/information.svg',
                  color: Colors.red,
                  height: 30.0,
                ),
                title: Text('Help'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              signout(authNotifier);
              ScopedModel.of<CartModel>(context).clearCart();
//              Navigator.pushReplacement(
//                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/images/exit.svg',
                  color: Colors.red,
                  height: 30.0,
                ),
                title: Text('LogOut'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
