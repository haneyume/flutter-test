import 'package:flutter/material.dart';

import 'drag_drop_page.dart';
import 'canvas_page.dart';
import 'code_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Test Project'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              DragDropPage(),
              CanvasPage(),
              CodePage(),
            ],
          ),
        ),
      ),
    );
  }
}
