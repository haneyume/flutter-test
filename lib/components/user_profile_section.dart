import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileSection extends StatefulWidget {
  final String userId;

  const UserProfileSection({super.key, required this.userId}) : super();

  @override
  State<UserProfileSection> createState() => _UserProfileSectionState();
}

class _UserProfileSectionState extends State<UserProfileSection> {
  @override
  Widget build(BuildContext context) {
    final future = Supabase.instance.client
        .from('users')
        .select()
        .eq('id', widget.userId)
        .single();

    return FutureBuilder<Map<String, dynamic>>(
      future: future,
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
    );
  }
}
