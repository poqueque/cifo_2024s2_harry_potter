import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harry_potter/models/character.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    var imageUrl = character.imageUrl ?? Character.harryUrl;
    return Scaffold(
      appBar: AppBar(
        title: Text("${character.name} details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: character.name,
            child: Image.network(imageUrl)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star_border),
                  Icon(Icons.star_border),
                ],
              ),
              Text("89 reviews"),
            ],
          ),
          Text(
            character.name,
            style: TextStyle(
              fontSize: 28,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.fitness_center),
                  const Text("Força"),
                  Text("${character.strenght}"),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.auto_fix_normal),
                  const Text("Màgia"),
                  Text("${character.magic}"),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.speed),
                  const Text("Velocitat"),
                  Text("${character.speed}"),
                ],
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
      ),
    );
  }
}
