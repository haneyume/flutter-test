import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../components//user_profile_section.dart';
import '../../components/user_post_gallery.dart';

class MeView extends StatefulWidget {
  const MeView({super.key});

  @override
  State<MeView> createState() => _MeViewState();
}

class _MeViewState extends State<MeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Me'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () => Navigator.of(context).pushNamed('/settings'),
        ),
      ]),
      body: Column(children: [
        UserProfileSection(
          userId: Supabase.instance.client.auth.currentUser!.id,
        ),
        Expanded(
          child: UserPostGallery(
            userId: Supabase.instance.client.auth.currentUser!.id,
          ),
        ),
      ]),
    );
  }
}
