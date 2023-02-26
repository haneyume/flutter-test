import 'package:flutter/material.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({Key? key}) : super(key: key);

  @override
  CanvasPageState createState() => CanvasPageState();
}

class CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text('Drag & Drop'),
      ],
    );
  }
}
