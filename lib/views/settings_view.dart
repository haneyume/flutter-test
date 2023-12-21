import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../my_app.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(children: <Widget>[
          const ListTile(
            title: Text('測試標題一'),
            subtitle: Text('測試內容一'),
            leading: Icon(Icons.event_seat),
          ),
          const ListTile(
            title: Text('測試標題一'),
            subtitle: Text('測試內容一'),
            leading: Icon(Icons.event_seat),
          ),
          const ListTile(
            title: Text('測試標題一'),
            subtitle: Text('測試內容一'),
            leading: Icon(Icons.event_seat),
          ),
          SwitchListTile(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
                MyApp.of(context)
                    .changeTheme(value ? ThemeMode.dark : ThemeMode.light);
              });
            },
            title: const Text('Dark Mode'),
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () async {
              await Supabase.instance.client.auth.signOut();
            },
          ),
        ]));
  }
}
