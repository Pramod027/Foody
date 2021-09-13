import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_styles.dart';

class ChatCard extends StatelessWidget {
  final String text;
  final String date;
  final Color containerColor;
  final Color dateColor;

  const ChatCard(
      {Key key, this.text, this.date, this.containerColor, this.dateColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            child:
                Text('This is a sent message', style: AppStyles().sentMessage),
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            width: 200.w,
            decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(8.0)),
            margin: EdgeInsets.only(right: 10.0),
          )
        ],
        mainAxisAlignment:
            MainAxisAlignment.end, // aligns the chatitem to right end
      ),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          child: Text(
            'Date',
            style: TextStyle(
                color: dateColor, fontSize: 12.0, fontStyle: FontStyle.normal),
          ),
          margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
        )
      ])
    ]));
  }
}
