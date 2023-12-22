import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'views/login_screen.dart';
import 'views/main_tab_view.dart';

import 'views/settings_view.dart';
import 'views/camera_view.dart';

import 'views/user_view.dart';
import 'views/user_follower_view.dart';
import 'views/user_following_view.dart';

import 'views/post_view.dart';
import 'views/post_like_view.dart';

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
        '/camera': (_) => const CameraView(),
      },
      onGenerateRoute: (settings) {
        final args = settings.arguments as Map<String, dynamic>;

        switch (settings.name) {
          case '/user':
            return MaterialPageRoute(
              builder: (_) => UserView(userId: args['userId']),
            );
          case '/user_follower':
            return MaterialPageRoute(
              builder: (_) => UserFollowerView(userId: args['userId']),
            );
          case '/user_following':
            return MaterialPageRoute(
              builder: (_) => UserFollowingView(userId: args['userId']),
            );
          case '/post':
            return MaterialPageRoute(
              builder: (_) => PostView(postId: args['postId']),
            );
          case '/post_like':
            return MaterialPageRoute(
              builder: (_) => PostLikeView(postId: args['postId']),
            );
        }

        return null;
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
