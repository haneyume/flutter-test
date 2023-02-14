import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(children: const <Widget>[
          ListTile(
            title: Text('測試標題一'),
            subtitle: Text('測試內容一'),
            leading: Icon(Icons.event_seat),
          ),
          ListTile(
            title: Text('測試標題一'),
            subtitle: Text('測試內容一'),
            leading: Icon(Icons.event_seat),
          ),
          ListTile(
            title: Text('測試標題一'),
            subtitle: Text('測試內容一'),
            leading: Icon(Icons.event_seat),
          ),
        ]));
  }
}
