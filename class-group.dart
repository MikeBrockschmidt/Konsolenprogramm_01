class Group {
  // Attribute
  final int id;
  final String groupName;
  final String groupLocation;
  final List<User> groupMembers;

  // Konstruktor
  Group(this.id, this.groupName, this.groupLocation, this.groupMembers);

  // Methode: Wer gehört zu dieser Gruppe?
  void printGroupMembers() {
    if (groupMembers.isEmpty) {
      print("Die Gruppe $groupName hat keine Mitglieder.");
    } else {
      print("Mitglieder der Gruppe $groupName:");
      for (var member in groupMembers) {
        print("-> ${member.firstName} ${member.lastName}");
      }
    }
  }
}

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
  final List<String>? representedInGroups;

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
    this.representedInGroups,
  });
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
    representedInGroups: ["Familie"],
  );

  // Gruppen anlegen
  Group familie = Group(1, "Familie", "Osnabrück", [martha, max, melanie]);
  Group kinogruppe = Group(2, "Kinogruppe", "Osnabrück", [max]);

  familie.printGroupMembers();
}
