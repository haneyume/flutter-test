import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: const Center(
        child: Text("Explore"),
      ),
    );
  }
}
