import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'views/main_tab_view.dart';
import 'views/settings_view.dart';
import 'views/message_room_view.dart';
import 'views/camera_view.dart';

// import 'test_project/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_KEY'] ?? '',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MainTabView(),
      // home: const HomePage(),
      routes: <String, WidgetBuilder>{
        '/settings': (_) => const SettingsView(),
        '/message_room': (_) => const MessageRoomView(),
        '/camera': (_) => const CameraView(),
      },
    );
  }
}
