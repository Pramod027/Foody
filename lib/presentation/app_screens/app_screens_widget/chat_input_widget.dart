import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_styles.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.face),
                color: Colors.blue,
                onPressed: () {},
              ),
            ),
            color: Colors.white,
          ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                style: TextStyle(color: Colors.blue, fontSize: 15.sp),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                    hintText: 'Type a message',
                    hintStyle: AppStyles().receiveMessage),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: new Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => {},
                color: Colors.blue,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.h,
      decoration: new BoxDecoration(
          border:
              new Border(top: new BorderSide(color: Colors.blue, width: 0.5)),
          color: Colors.white),
    );
  }
}
