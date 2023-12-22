import 'package:flutter/material.dart';

class PostLikeView extends StatefulWidget {
  final String postId;

  const PostLikeView({super.key, required this.postId}) : super();

  @override
  State<PostLikeView> createState() => _PostLikeViewState();
}

class _PostLikeViewState extends State<PostLikeView> {
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
