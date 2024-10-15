import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  bool _showSubtitle = false;
  bool get showSubtitle => _showSubtitle;

  Preferences() {
    getShowSubtitles().then((value) {
      _showSubtitle = value;
      notifyListeners();
    });
  }

  Future<void> setShowSubtitles(bool value) async {
    _showSubtitle = value;
    await asyncPrefs.setBool("show_subtitle", value);
    notifyListeners();
  }

  Future<bool> getShowSubtitles() async {
    return await asyncPrefs.getBool('show_subtitle') ?? false;
  }
}
