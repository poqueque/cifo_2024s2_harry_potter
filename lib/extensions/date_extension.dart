extension DateExtension on DateTime {

  String get readableDate =>  "$day/$month/$year";

  int getAge() {
    DateTime now = DateTime.now();
    Duration duration = now.difference(this);
    int age = duration.inYears;
    return age;
  }

}

extension DurationExtension on Duration {

  int get inYears => inDays ~/365;

}