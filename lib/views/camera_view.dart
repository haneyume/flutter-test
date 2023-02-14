import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: const Text("個人資料頁"),
    );
  }
}
