import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("聊天室頁"),
    );
  }
}
