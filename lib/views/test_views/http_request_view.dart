import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpRequestView extends StatefulWidget {
  const HttpRequestView({super.key});

  @override
  State<HttpRequestView> createState() => _HttpRequestViewState();
}

class _HttpRequestViewState extends State<HttpRequestView> {
  List data = [];

  Future<void> getData() async {
    var url = Uri.https("jsonplaceholder.typicode.com", "/posts",
        {"_limit": "30", "_expand": "user"});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HttpRequest'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => Navigator.of(context).pushNamed('/camera'),
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () => Navigator.of(context).pushNamed('/message_room'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(data[index]["title"]),
            subtitle: Text(data[index]["body"]),
          );
        },
      ),
    );
  }
}
