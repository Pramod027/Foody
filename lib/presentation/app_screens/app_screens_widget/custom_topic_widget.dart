import 'package:flutter/material.dart';
import 'package:workshop/shared/app_styles.dart';

class CustomTopicWidget extends StatelessWidget {
  final String topic;

  const CustomTopicWidget({Key key, this.topic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(topic, style: AppStyles().titleText),
    );
  }
}
