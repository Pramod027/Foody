import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AniminatedSearchCard extends StatefulWidget {
  @override
  _AniminatedSearchCardState createState() => _AniminatedSearchCardState();
}

class _AniminatedSearchCardState extends State<AniminatedSearchCard> {
  bool _folded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      //fixing the splash
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          //fixing the BorderRadius of the screen
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_folded ? 32.r : 0),
            topRight: Radius.circular(32.r),
            bottomLeft: Radius.circular(_folded ? 32.r : 0),
            bottomRight: Radius.circular(32.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Icon(
              _folded ? Icons.search : Icons.close,
              color: Colors.grey,
            ),
          ),
          onTap: () {
            setState(() {
              _folded = !_folded;
            });
          },
        ),
      ),
    );
  }
}
