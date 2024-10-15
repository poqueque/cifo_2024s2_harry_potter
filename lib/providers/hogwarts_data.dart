import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/services/database.dart';

class HogwartsData extends ChangeNotifier {
  HogwartsData() {
    init();
  }

  List<Character> characters = [];

  List<Character> initialCharacters = [
    Character(
      name: "Harry Potter",
      imageUrl: Character.harryUrl,
      strenght: 9,
      magic: 10,
      speed: 8,
      birthDate: DateTime(1980, 7, 31),
    ),
    Character(
      name: "Ron Weasley",
      imageUrl: Character.ronUrl,
      strenght: 8,
      magic: 6,
      speed: 9,
      birthDate: DateTime(1980, 3, 1),
    ),
    Character(
      name: "Hermione Granger",
      imageUrl: Character.hermioneUrl,
      strenght: 10,
      magic: 9,
      speed: 7,
      birthDate: DateTime(1979, 9, 19),
    ),
  ];

  Future<void> init() async {
    characters = await Database.instance.getAllCharacters();
    if (characters.isEmpty) {
      for (var character in initialCharacters) {
        await Database.instance.updateCharacter(character);
      }
      characters = await Database.instance.getAllCharacters();
    }
    notifyListeners();
  }

  Character getCharacter(int id) =>
      characters.firstWhere((element) => element.id == id);

  void addRating(int id, int value) {
    Character character = getCharacter(id);
    character.addRating(value);
    Database.instance.updateCharacter(character);
    notifyListeners();
  }

  void toggleFavorite(int id) {
    Character character = getCharacter(id);
    character.favorite = !character.favorite;
    Database.instance.updateCharacter(character);
    notifyListeners();
  }
}
