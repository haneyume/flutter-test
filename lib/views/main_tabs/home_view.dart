import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _future = Supabase.instance.client
      .from('posts')
      .select('*, user: user_id (*)')
      .range(0, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => Navigator.of(context).pushNamed('/camera'),
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, index) {
              final item = data[index];
              final userNickname = item['user']['nickname'].toString();
              final userAvatarUrl = item['user']['avatar_url'].toString();
              final mediaUrl = item['medias'][0].toString();
              final content = item['content'].toString();
              final likeCount = item['like_count'].toString();
              final commentCount = item['comment_count'].toString();
              final createdAt = item['created_at'].toString();

              // return ListTile(
              //   leading: CircleAvatar(
              //     backgroundImage: NetworkImage(userAvatarUrl),
              //   ),
              //   title: Text(item['like_count'].toString()),
              // );

              return Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(userAvatarUrl),
                      ),
                      title: Text(userNickname),
                    ),
                    AspectRatio(
                        aspectRatio: 16.0 / 9.0,
                        child: Image.network(mediaUrl, fit: BoxFit.cover)),
                    Text(content),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                        Text(likeCount),
                        IconButton(
                          icon: const Icon(Icons.comment_outlined),
                          onPressed: () {},
                        ),
                        Text(commentCount),
                        const Spacer(),
                        Text(createdAt),
                      ],
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
