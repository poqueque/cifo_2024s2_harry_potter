import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hogwarts App"),
      ),
      body: Consumer<HogwartsData>(builder: (context, hogwartsData, child) {
        return ListView(
          children: [
            for (var character in hogwartsData.characters)
              Padding(
                padding: const EdgeInsets.all(4),
                child: ListTile(
                  leading: Hero(
                      tag: character.name,
                      child: Image.network(
                          character.imageUrl ?? Character.harryUrl)),
                  title: Text(character.name),
                  subtitle: Text("${character.totalReviews} valoracions"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterDetail(id: character.id),
                      ),
                    );
                  },
                  trailing: InkWell(
                    onTap: () {
                      hogwartsData.toggleFavorite(character.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        (character.favorite)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              )
          ],
        );
      }),
    );
  }
}
