import 'package:flutter/material.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/app_screen_widget_export.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            //appBar: ChatAppBar(), // Custom app bar for chat screen
            body: Stack(children: <Widget>[
      Column(
        children: <Widget>[
          ChatListWidget(), //Chat list
          InputWidget() // The input widget
        ],
      ),
    ])));
  }
}

class ConversationPageList extends StatefulWidget {
  @override
  _ConversationPageListState createState() => _ConversationPageListState();
}

class _ConversationPageListState extends State<ConversationPageList> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        ConversationPage(),
      ],
    );
  }
}

class ChatItemWidget extends StatelessWidget {
  var index;

  ChatItemWidget(this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (index % 2 == 0) {
      //This is the sent message. We'll later use data from firebase instead of index to determine the message is sent or received.
      return ChatCard(
        date: 'Date',
        text: 'This is a sent message',
        containerColor: Colors.greenAccent,
        dateColor: Colors.grey,
      );
    } else {
      // This is a received message
      return ChatCard(
        date: 'Date',
        text: 'This is a received message',
        containerColor: Colors.lightBlueAccent,
        dateColor: Colors.blue,
      );
    }
  }
}

class ChatListWidget extends StatelessWidget {
  final ScrollController listScrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
        child: ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, index) => ChatItemWidget(index),
      itemCount: 10,
      reverse: true,
      controller: listScrollController,
    ));
  }
}
