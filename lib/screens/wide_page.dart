import 'package:flutter/material.dart';
import 'package:harry_potter/providers/preferences.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/screens/character_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidePage extends StatefulWidget {
  const WidePage({super.key, this.characterId});

  final int? characterId;

  @override
  State<WidePage> createState() => _WidePageState();
}

class _WidePageState extends State<WidePage> {
  int? characterId;

  late AppLocalizations l;

  @override
  void initState() {
    super.initState();
    characterId = widget.characterId;
    l = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(l.appBarText),
          actions: [
            Consumer<Preferences>(builder: (context, preferences, child) {
              return Switch(
                  value: preferences.showSubtitle,
                  onChanged: (value) {
                    preferences.setShowSubtitles(value);
                  });
            }),
          ],
        ),
        body: Row(
          children: [
            Flexible(
              flex: 1,
              child: CharacterList(
                showAppBar: false,
                onCharacterTapped: (id) {
                  characterId = id;
                  setState(() {});
                },
              ),
            ),
            if (characterId != null)
              Flexible(
                  flex: 2,
                  child: CharacterDetail(
                    id: characterId!,
                    showAppBar: false,
                  ))
            else
              const Flexible(
                flex: 2,
                child: Center(
                  child: Text("Si us plau, escull un personatge"),
                ),
              ),
          ],
        ));
  }
}
