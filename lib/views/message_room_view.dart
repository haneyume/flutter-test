import 'package:flutter/material.dart';

class MessageRoomView extends StatefulWidget {
  const MessageRoomView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MessageRoomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: const Text("個人資料頁"),
    );
  }
}
