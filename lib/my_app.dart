import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'views/login_screen.dart';
import 'views/main_tab_view.dart';
import 'views/settings_view.dart';
import 'views/message_room_view.dart';
import 'views/camera_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;
}

class MyAppState extends State<MyApp> {
  ThemeMode currentThemeMode = ThemeMode.dark;

  void changeTheme(ThemeMode chagedThemeMode) {
    setState(() {
      currentThemeMode = chagedThemeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentThemeMode,
      home: const AppContent(),
      routes: <String, WidgetBuilder>{
        '/settings': (_) => const SettingsView(),
        '/message_room': (_) => const MessageRoomView(),
        '/camera': (_) => const CameraView(),
      },
      onGenerateRoute: (settings) {
        final args = settings.arguments as Map<String, dynamic>;

        if (settings.name == '/post') {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(args['title'].toString()),
              ),
              body: Center(
                child: Text(args['content'].toString()),
              ),
            ),
          );
        } else if (settings.name == '/user') {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(args['title'].toString()),
              ),
              body: Center(
                child: Text(args['content'].toString()),
              ),
            ),
          );
        } else {
          return null;
        }
      },
    );
  }
}

class AppContent extends StatefulWidget {
  const AppContent({super.key});

  @override
  State<AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  bool _isLogin = false;

  @override
  void initState() {
    super.initState();

    _setupAuthListener();
  }

  void _setupAuthListener() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      // print('event: ${data.event.toString()}');
      // print('uid: ${data.session?.user.id}');

      if (data.session?.user != null) {
        setState(() {
          _isLogin = true;
        });
      } else {
        setState(() {
          _isLogin = false;
        });

        Navigator.of(context).popUntil(ModalRoute.withName('/'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLogin ? const MainTabView() : const LoginScreen();
  }
}
