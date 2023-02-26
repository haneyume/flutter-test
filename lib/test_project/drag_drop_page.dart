import 'package:flutter/material.dart';

class DragDropPage extends StatefulWidget {
  const DragDropPage({Key? key}) : super(key: key);

  @override
  DragDropPageState createState() => DragDropPageState();
}

class DragDropPageState extends State<DragDropPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text('Drag & Drop'),
        SizedBox(height: 20),
        const MyDraggable(),
        SizedBox(height: 10),
        const MyDragTarget(),
      ],
    );
  }
}

class MyDraggable extends StatelessWidget {
  const MyDraggable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      onDragStarted: () {
        debugPrint('onDragStarted(), 開始拖動');
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        debugPrint('onDraggableCanceled(), 被放掉＋沒被接受');
      },
      onDragCompleted: () {
        debugPrint('onDragCompleted(), 被放掉＋接受');
      },
      onDragEnd: (DraggableDetails details) {
        debugPrint('onDragEnd(), 被放掉');
      },
      data: Colors.orange,
      feedback: Container(
        width: 100,
        height: 100,
        color: Colors.orange,
      ),
      childWhenDragging: Container(
        width: 100,
        height: 100,
        color: Colors.deepOrange,
      ),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.orange,
      ),
    );
  }
}

class MyDragTarget extends StatefulWidget {
  const MyDragTarget({Key? key}) : super(key: key);

  @override
  MyDragTargetState createState() => MyDragTargetState();
}

class MyDragTargetState extends State<MyDragTarget> {
  MaterialColor _acceptedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 200,
          height: 200,
          color: _acceptedColor,
        );
      },
      onWillAccept: (MaterialColor? data) {
        debugPrint('onWillAccept()');

        return true;
      },
      onAccept: (MaterialColor data) {
        debugPrint('onAccept()');

        setState(() {
          _acceptedColor = data;
        });
      },
      onLeave: (MaterialColor? data) {
        debugPrint('onLeave()');

        setState(() {
          _acceptedColor = Colors.grey;
        });
      },
    );
  }
}
