import 'package:flutter/material.dart';
import 'package:harry_potter/screens/narrow_page.dart';
import 'package:harry_potter/screens/wide_page.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key, this.characterId});

  final int? characterId;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const NarrowPage();
      } else {
        return WidePage(characterId: characterId,);
      }
    });
  }
}
