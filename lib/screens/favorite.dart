import 'package:flutter/material.dart';
import 'package:lab_2/provider/favorite_provider.dart';
import '../models/joke.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final jokes = provider.jokes;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return ListTile(
            title: Text(joke),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite(joke);
              },
              icon: provider.isExist(joke)
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    );
  }
}
