import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/screens/character_detail.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hogwarts App"),
      ),
      body: ListView(
        children: [
          for (var character in characters)
            Padding(
              padding: const EdgeInsets.all(4),
              child: ListTile(
                leading: Hero(
                    tag: character.name,
                    child: Image.network(
                        character.imageUrl ?? Character.harryUrl)),
                title: Text(character.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CharacterDetail(character: character),
                    ),
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
