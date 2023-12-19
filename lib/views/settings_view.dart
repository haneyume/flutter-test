import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
