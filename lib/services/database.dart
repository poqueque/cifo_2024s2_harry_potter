import 'package:harry_potter/models/character.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {

  static final Database _singleton = Database._internal();
  Database._internal();

  static Database get instance => _singleton;

  Isar? isar;

  Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [CharacterSchema],
      directory: dir.path,
    );
    return isar!;
  }

  Future<List<Character>> getAllCharacters() async {
    isar ??= await init();
    return isar!.characters.where().findAll();
  }

  Future<void> updateCharacter(Character character) async {
    isar ??= await init();
    await isar!.writeTxn(() async {
      await isar!.characters.put(character);
    });
  }

}