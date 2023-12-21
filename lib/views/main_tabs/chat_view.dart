import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _future = Supabase.instance.client.from('posts').select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
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

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    item['user']['avatar_url'].toString(),
                  ),
                ),
                title: Text(item['content'].toString()),
                subtitle: Text(item['user']['username'].toString()),
              );
            }),
          );
        },
      ),
    );
  }
}
