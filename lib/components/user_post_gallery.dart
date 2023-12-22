import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserPostGallery extends StatefulWidget {
  final String userId;

  const UserPostGallery({super.key, required this.userId}) : super();

  @override
  State<UserPostGallery> createState() => _UserPostGalleryState();
}

class _UserPostGalleryState extends State<UserPostGallery> {
  @override
  Widget build(BuildContext context) {
    final future = Supabase.instance.client
        .from('posts')
        .select()
        .eq('user_id', widget.userId)
        .range(0, 30);

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data!;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: data.length,
          itemBuilder: ((context, index) {
            final item = data[index];
            final id = item['id'].toString();
            final mediaUrl = item['medias'][0].toString();

            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/post',
                    arguments: {"postId": id});
              },
              child: Image.network(mediaUrl),
            );
          }),
        );
      },
    );
  }
}
