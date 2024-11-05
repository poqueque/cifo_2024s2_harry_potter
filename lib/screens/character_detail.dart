import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harry_potter/extensions/date_extension.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/screens/responsive_page.dart';
import 'package:harry_potter/widgets/rating.dart';
import 'package:provider/provider.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.id, this.showAppBar = true});

  final int id;
  final bool showAppBar;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  int lastClickedStars = 0;
  late Character character;

  late AppLocalizations l;

  @override
  void initState() {
    super.initState();
    character = context.read<HogwartsData>().getCharacter(widget.id);
  }

  @override
  void didUpdateWidget(covariant CharacterDetail oldWidget) {
    super.didUpdateWidget(oldWidget);
    character = context.read<HogwartsData>().getCharacter(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    l = AppLocalizations.of(context)!;
    var imageUrl = character.imageUrl ?? Character.harryUrl;
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(l.characterDetails(character.name)),
            )
          : null,
      body: LayoutBuilder(builder: (context, _) {
        var totalWidth = MediaQuery.of(context).size.width;
        if (widget.showAppBar && totalWidth > 600) {
          Future.delayed(Duration.zero, () {
            if (!context.mounted) return;
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResponsivePage(
                  characterId: widget.id,
                ),
              ),
            );
          });
        }

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(tag: character.name, child: Image.network(imageUrl)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(value: character.average),
                  Flexible(
                      child: Text(
                    l.nReviews(character.totalReviews),
                    textAlign: TextAlign.center,
                  )),
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
                character.name,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(character.birthDate.readableDate),
                  Text("  (${l.nYears(character.birthDate.getAge())})")
                ],
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
                      Text(l.strenght),
                      Text("${character.strenght}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.auto_fix_normal),
                      Text(l.magic),
                      Text("${character.magic}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.speed),
                      Text(l.speed),
                      Text("${character.speed}"),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
