import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  var lastValueClicked = 0;

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
          Hero(tag: widget.character.name, child: Image.network(imageUrl)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Rating(value: widget.character.ratingAverage),
              Text("${widget.character.totalReviews} reviews"),
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
            value: lastValueClicked.toDouble(),
            onClick: (int value) {
              lastValueClicked = value;
              widget.character.totalReviews++;
              widget.character.totalRatings += value;
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
