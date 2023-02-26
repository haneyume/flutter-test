import 'package:flutter/material.dart';

// import 'views/main_tab_view.dart';
import 'views/setting_view.dart';

import 'test_project/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      // home: const MainTabView(),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        '/setting': (_) => const SettingView(),
      },
    );
  }
}
