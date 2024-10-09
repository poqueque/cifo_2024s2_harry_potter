import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/widgets/rating.dart';
import 'package:provider/provider.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.id});

  final int id;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  int lastClickedStars = 0;
  late Character character;

  @override
  void initState() {
    super.initState();
    character = context.read<HogwartsData>().getCharacter(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var imageUrl = widget.character.imageUrl ?? Character.harryUrl;
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.character.name} details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(tag: character.name, child: Image.network(imageUrl)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Rating(value: character.average),
              Text("${character.totalReviews} reviews"),
              Consumer<HogwartsData>(
                builder: (context, hogwartsData, child) {
                  return InkWell(
                    onTap: () {
                      hogwartsData.toggleFavorite(character.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(
                            (character.favorite)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          Text(
            widget.character.name,
            style: TextStyle(
              fontSize: 28,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          Rating(
            value: lastClickedStars.toDouble(),
            color: Colors.deepPurple,
            onStarClicked: (int i) {
              lastClickedStars = i;
              context.read<HogwartsData>().addRating(widget.id, i);
              setState(() {});
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.fitness_center),
                  const Text("Força"),
                  Text("${widget.character.strenght}"),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.auto_fix_normal),
                  const Text("Màgia"),
                  Text("${widget.character.magic}"),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.speed),
                  const Text("Velocitat"),
                  Text("${widget.character.speed}"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
