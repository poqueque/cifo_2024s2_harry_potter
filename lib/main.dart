import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/providers/preferences.dart';
import 'package:harry_potter/screens/responsive_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HogwartsData()),
        ChangeNotifierProvider(create: (context) => Preferences()),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.purple,
            centerTitle: true,
          ),
        ),
        home: const ResponsivePage(),
      ),
    );
  }
}
