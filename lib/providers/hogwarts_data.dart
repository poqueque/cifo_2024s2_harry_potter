import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

class HogwartsData extends ChangeNotifier {
  List<Character> characters = [
    Character(
      id: 1,
      name: "Harry Potter",
      imageUrl: Character.harryUrl,
      strenght: 9,
      magic: 10,
      speed: 8,
      birthDate: DateTime(1980, 7, 31),
    ),
    Character(
      id: 2,
      name: "Ron Weasley",
      imageUrl: Character.ronUrl,
      strenght: 8,
      magic: 6,
      speed: 9,
      birthDate: DateTime(1980, 3, 1),
    ),
    Character(
      id: 3,
      name: "Hermione Granger",
      imageUrl: Character.hermioneUrl,
      strenght: 10,
      magic: 9,
      speed: 7,
      birthDate: DateTime(1979, 9, 19),
    ),
  ];

  Character getCharacter(int id) =>
      characters.firstWhere((element) => element.id == id);

  void addRating(int id, int value) {
    Character character = getCharacter(id);
    character.addRating(value);
    notifyListeners();
  }

  void toggleFavorite(int id) {
    Character character = getCharacter(id);
    character.favorite = !character.favorite;
    notifyListeners();
  }
}
