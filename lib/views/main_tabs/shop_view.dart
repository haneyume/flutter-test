import 'package:flutter/material.dart';

class ShopView extends StatefulWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: const Center(
        child: Text("Shop"),
      ),
    );
  }
}
