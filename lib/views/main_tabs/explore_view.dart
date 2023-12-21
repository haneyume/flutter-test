import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final _future = Supabase.instance.client.from('posts').select().range(0, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
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
              final mediaUrl = item['medias'][0].toString();

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/post', arguments: item);
                },
                child: Image.network(mediaUrl),
              );
            }),
          );
        },
      ),
    );
  }
}
