import 'package:flutter/material.dart';

class UserFollowingView extends StatefulWidget {
  final String userId;

  const UserFollowingView({super.key, required this.userId}) : super();

  @override
  State<UserFollowingView> createState() => _UserFollowingViewState();
}

class _UserFollowingViewState extends State<UserFollowingView> {
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
