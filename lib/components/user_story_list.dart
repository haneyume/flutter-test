import 'package:flutter/material.dart';

class UserStoryList extends StatefulWidget {
  final String userId;

  const UserStoryList({super.key, required this.userId}) : super();

  @override
  State<UserStoryList> createState() => _UserStoryListState();
}

class _UserStoryListState extends State<UserStoryList> {
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
