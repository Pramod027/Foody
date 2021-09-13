import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/shared_export.dart';

class LocalImageCard extends StatelessWidget {
  final File imageFile;
  final VoidCallback pressed;

  const LocalImageCard({Key key, this.imageFile, this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.file(
            imageFile,
            fit: BoxFit.cover,
            height: 150.h,
          ),
        ),
        FlatButton(
          padding: EdgeInsets.all(16.w),
          color: Colors.black54,
          child: Text('Change Image', style: AppStyles().mediumBlock),
          onPressed: () => pressed(),
        )
      ],
    );
  }
}
