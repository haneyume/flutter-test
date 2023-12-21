import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MeView extends StatefulWidget {
  const MeView({super.key});

  @override
  State<MeView> createState() => _MeViewState();
}

class _MeViewState extends State<MeView> {
  final _future = Supabase.instance.client
      .from('users')
      .select()
      .eq('id', Supabase.instance.client.auth.currentUser!.id)
      .single();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Me'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () => Navigator.of(context).pushNamed('/settings'),
        ),
      ]),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          final userNickname = data['nickname'].toString();
          final userAvatarUrl = data['avatar_url'].toString();
          final postCount = data['post_count'].toString();
          final followerCount = data['follower_count'].toString();
          final followingCount = data['following_count'].toString();
          final introduction = data['introduction'].toString();

          return Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(userAvatarUrl),
                  ),
                  Text(userNickname),
                  const Spacer(),
                  Column(
                    children: [
                      const Text('Posts'),
                      Text(postCount),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Followers'),
                      Text(followerCount),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Following'),
                      Text(followingCount),
                    ],
                  ),
                ],
              ),
              Text(introduction),
            ],
          );
        },
      ),
    );
  }
}
