//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:workshop/dialog_box_app/constants.dart';
//import 'package:workshop/dialog_box_app/splash_screen.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Splash(),
//    );
//  }
//}
//
//class Splash extends StatefulWidget {
//  @override
//  VideoState createState() => VideoState();
//}
//
//class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
//  var _visible = true;
//
//  AnimationController animationController;
//  Animation<double> animation;
//
//  startTime() async {
//    var _duration = new Duration(seconds: 2);
//    return new Timer(_duration, navigationPage);
//  }
//
//  void navigationPage() {
//    Navigator.of(context)
//        .push(MaterialPageRoute(builder: (context) => Dialogs()));
//  }
//
//  @override
//  void initState() {
//    super.initState();
//
//    animationController = new AnimationController(
//        vsync: this, duration: new Duration(seconds: 1));
//    animation =
//        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
//
//    animation.addListener(() => this.setState(() {}));
//    animationController.forward();
//
//    setState(() {
//      _visible = !_visible;
//    });
//    startTime();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: Stack(
//        fit: StackFit.expand,
//        children: <Widget>[
//          new Column(
//            mainAxisAlignment: MainAxisAlignment.end,
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              Padding(
//                  padding: EdgeInsets.only(bottom: 30.0),
//                  child: new Image.asset(
//                    'assets/powered_by.png',
//                    height: 25.0,
//                    fit: BoxFit.scaleDown,
//                  ))
//            ],
//          ),
//          new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              new Image.asset(
//                'assets/devs.jpg',
//                width: animation.value * 250,
//                height: animation.value * 250,
//              ),
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class Dialogs extends StatefulWidget {
//  @override
//  _DialogsState createState() => _DialogsState();
//}
//
//class _DialogsState extends State<Dialogs> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Custom Dialog In Flutter"),
//        centerTitle: true,
//        automaticallyImplyLeading: false,
//      ),
//      body: Container(
//        child: Center(
//          child: RaisedButton(
//            onPressed: () {
//              showDialog(
//                  context: context,
//                  builder: (BuildContext context) {
//                    return CustomDialogBox(
//                      title: "Custom Dialog Demo",
//                      descriptions:
//                          "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
//                      text: "Yes",
//                    );
//                  });
//            },
//            child: Text("Custom Dialog"),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class CustomDialogBox extends StatefulWidget {
//  final String title, descriptions, text;
//  final Image img;
//
//  const CustomDialogBox(
//      {Key key, this.title, this.descriptions, this.text, this.img})
//      : super(key: key);
//
//  @override
//  _CustomDialogBoxState createState() => _CustomDialogBoxState();
//}
//
//class _CustomDialogBoxState extends State<CustomDialogBox> {
//  @override
//  Widget build(BuildContext context) {
//    return Dialog(
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.circular(Constants.padding),
//      ),
//      elevation: 0,
//      backgroundColor: Colors.transparent,
//      child: contentBox(context),
//    );
//  }
//
//  contentBox(context) {
//    return Stack(
//      children: <Widget>[
//        Container(
//          padding: EdgeInsets.only(
//              left: Constants.padding,
//              top: Constants.avatarRadius + Constants.padding,
//              right: Constants.padding,
//              bottom: Constants.padding),
//          margin: EdgeInsets.only(top: Constants.avatarRadius),
//          decoration: BoxDecoration(
//              shape: BoxShape.rectangle,
//              color: Colors.white,
//              borderRadius: BorderRadius.circular(Constants.padding),
//              boxShadow: [
//                BoxShadow(
//                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
//              ]),
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              Text(
//                widget.title,
//                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//              ),
//              SizedBox(
//                height: 15,
//              ),
//              Text(
//                widget.descriptions,
//                style: TextStyle(fontSize: 14),
//                textAlign: TextAlign.center,
//              ),
//              SizedBox(
//                height: 22,
//              ),
//              Align(
//                alignment: Alignment.bottomRight,
//                child: FlatButton(
//                    onPressed: () {
//                      Navigator.of(context).pop();
//                    },
//                    child: Text(
//                      widget.text,
//                      style: TextStyle(fontSize: 18),
//                    )),
//              ),
//            ],
//          ),
//        ),
//        Positioned(
//          left: Constants.padding,
//          right: Constants.padding,
//          child: CircleAvatar(
//            backgroundColor: Colors.transparent,
//            radius: Constants.avatarRadius,
//            child: ClipRRect(
//                borderRadius:
//                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
//                child: Image.asset("assets/model.jpeg")),
//          ),
//        ),
//      ],
//    );
//  }
//}
