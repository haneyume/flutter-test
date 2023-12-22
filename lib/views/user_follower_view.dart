import 'package:flutter/material.dart';

class UserFollowerView extends StatefulWidget {
  final String userId;

  const UserFollowerView({super.key, required this.userId}) : super();

  @override
  State<UserFollowerView> createState() => _UserFollowerViewState();
}

class _UserFollowerViewState extends State<UserFollowerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SNS'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.ac_unit),
          onPressed: () => Navigator.of(context).pushNamed('/settings'),
        ),
      ]),
      body: const Center(
        child: Text("User"),
      ),
    );
  }
}
