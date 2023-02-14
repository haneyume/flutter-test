import 'package:flutter/material.dart';

class NewView extends StatefulWidget {
  const NewView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<NewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New'),
      ),
      body: const Center(
        child: Text("New"),
      ),
    );
  }
}
