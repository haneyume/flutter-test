import 'package:flutter/material.dart';

class MeView extends StatefulWidget {
  const MeView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Me'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () => Navigator.of(context).pushNamed('/setting'),
        ),
      ]),
      body: const Center(
        child: Text("Me"),
      ),
    );
  }
}
