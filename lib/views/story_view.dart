import 'package:flutter/material.dart';

class StoryView extends StatefulWidget {
  final String postId;

  const StoryView({super.key, required this.postId}) : super();

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
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
