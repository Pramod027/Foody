import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop/app_api/food_api.dart';
import 'package:workshop/app_notifier/auth_notifier.dart';
import 'package:workshop/cart_app/cart_model.dart';
import 'package:workshop/dialog_box_app/constants.dart';

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
                    radius: 48.0,
                    child: SvgPicture.asset(
                      'assets/images/user.svg',
                      height: 60.0,
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
          SizedBox(
            height: 14,
          ),
          InkWell(
            onTap: () {
//              Scaffold.of(context).showSnackBar(SnackBar(
//                content: Text('${authNotifier.user.email}'),
//              ));
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
            height: 11,
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
            height: 11,
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
                title: Text('General'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          SizedBox(
            height: 11,
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
            height: 11,
          ),
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
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/images/exclamation-mark.svg',
                  color: Colors.red,
                  height: 30.0,
                ),
                title: Text('About us'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          SizedBox(
            height: 12,
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

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const CustomDialogBox(
      {Key key, this.title, this.descriptions, this.text, this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/images/fast_foods.png")),
          ),
        ),
      ],
    );
  }
}
