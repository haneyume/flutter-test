import 'package:flutter/material.dart';

class MessageRoomView extends StatefulWidget {
  const MessageRoomView({super.key});

  @override
  State<MessageRoomView> createState() => _MessageRoomViewState();
}

class _MessageRoomViewState extends State<MessageRoomView> {
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
