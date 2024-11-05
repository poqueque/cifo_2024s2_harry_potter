import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/providers/preferences.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatelessWidget {
  const CharacterList(
      {super.key, this.showAppBar = true, this.onCharacterTapped});

  final bool showAppBar;
  final Function(int)? onCharacterTapped;

  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(AppLocalizations.of(context)!.appBarText),
              actions: [
                Consumer<Preferences>(builder: (context, preferences, child) {
                  return Switch(
                      value: preferences.showSubtitle,
                      onChanged: (value) {
                        preferences.setShowSubtitles(value);
                      });
                }),
              ],
            )
          : null,
      body: Consumer<HogwartsData>(builder: (context, hogwartsData, child) {
        return ListView(
          children: [
            for (var character in hogwartsData.characters)
              Padding(
                padding: const EdgeInsets.all(4),
                child: Consumer<Preferences>(
                    builder: (context, preferences, child) {
                  return ListTile(
                    leading: Hero(
                        tag: character.name,
                        child: Image.network(
                            character.imageUrl ?? Character.harryUrl)),
                    title: Text(character.name),
                    subtitle: preferences.showSubtitle
                        ? Text(l.nReviews(character.totalReviews))
                        : null,
                    onTap: () {
                      if (onCharacterTapped == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CharacterDetail(id: character.id),
                          ),
                        );
                      } else {
                        onCharacterTapped?.call(character.id);
                      }
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
                  );
                }),
              ),
          ],
        );
      }),
    );
  }
}
