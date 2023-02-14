import 'package:flutter/material.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ActivityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SNS'),
      ),
      body: const Center(
        child: Text("Activity"),
      ),
    );
  }
}
