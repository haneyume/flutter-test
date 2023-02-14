import 'package:flutter/material.dart';

class MessageView extends StatefulWidget {
  MessageView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('aaa'),
      ),
      body: const Text("個人資料頁"),
    );
  }
}
