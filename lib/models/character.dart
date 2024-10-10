class Character {
  static const String harryUrl =
      "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/1000?cb=20160903184919";
  static const String ronUrl =
      "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest/scale-to-width-down/1000?cb=20150523213430";
  static const String hermioneUrl =
      "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1000?cb=20120729103114&path-prefix=es";

  final int id;
  final String name;
  final String? imageUrl;
  final int strenght;
  final int magic;
  final int speed;

  final DateTime birthDate;

  int totalReviews = 0;
  int _totalRatings = 0;
  double get average {
    if (totalReviews == 0) return 0;
    return _totalRatings / totalReviews;
  }
  bool favorite = false;

  void addRating(int value) {
    totalReviews++;
    _totalRatings += value;
  }

  Character({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.strenght,
    required this.magic,
    required this.speed,
    required this.birthDate,
  });
}
