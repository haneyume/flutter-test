import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  final String postId;

  const PostView({super.key, required this.postId}) : super();

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
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
