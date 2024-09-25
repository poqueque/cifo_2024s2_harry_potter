class Character {
  static const String harryUrl =
      "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/1000?cb=20160903184919";
  static const String ronUrl =
      "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest/scale-to-width-down/1000?cb=20150523213430";
  static const String hermioneUrl =
      "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1000?cb=20120729103114&path-prefix=es";

  final String name;
  final String? imageUrl;
  final int strenght;
  final int magic;
  final int speed;

  const Character(
      {required this.name,
      this.imageUrl,
      required this.strenght,
      required this.magic,
      required this.speed});
}

List<Character> characters = const [
  Character(
    name: "Harry Potter",
    imageUrl: Character.harryUrl,
    strenght: 9,
    magic: 10,
    speed: 8,
  ),
  Character(
    name: "Ron Weasley",
    imageUrl: Character.ronUrl,
    strenght: 8,
    magic: 6,
    speed: 9,
  ),
  Character(
    name: "Hermione Granger",
    imageUrl: Character.hermioneUrl,
    strenght: 10,
    magic: 9,
    speed: 7,
  ),
];
