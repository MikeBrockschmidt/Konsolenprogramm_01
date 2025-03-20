class User {
  // Attribute
  final String id;
  final String firstName;
  final String lastName;
  final String? email;
  final String? phoneNumber;
  final String avatarUrl;
  final String? miscellaneous;
  final String birthday;
  final List<String> representedInGroups;

  // Konstruktor
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.phoneNumber,
    required this.avatarUrl,
    this.miscellaneous,
    required this.birthday,
    this.representedInGroups = const [],
  });

  void printGroups() {
    if (representedInGroups.isEmpty) {
      print("$firstName gehört aktuell keiner Gruppe an.");
    } else {
      print("$firstName ist in folgenden Gruppen:");
      for (var group in representedInGroups) {
        print("-> $group");
      }
    }
  }
}

void main() {
  User martha = User(
    id: "1",
    firstName: "Martha",
    lastName: "Brockschmidt",
    avatarUrl: "bla.jpg",
    miscellaneous: "Mag Katzen",
    birthday: "26.09.2017",
    representedInGroups: ["Familie"],
  );

  User max = User(
    id: "2",
    firstName: "Max",
    lastName: "Brockschmidt",
    avatarUrl: "max.jpg",
    miscellaneous: "Liebt Filme",
    birthday: "23.07.2016",
  );

  User melanie = User(
    id: "3",
    firstName: "Melanie",
    lastName: "Brockschmidt",
    email: "melanie@gmx.com",
    phoneNumber: "+491234567892",
    avatarUrl: "melanie.jpg",
    miscellaneous: "Spielt Geige",
    birthday: "20.03.1992",
    representedInGroups: ["Familie, Kinogruppe"],
  );

  max.printGroups();
  martha.printGroups();
}
