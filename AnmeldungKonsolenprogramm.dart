import 'dart:io';

void main() {
  showLogo();
  startAnmeldung();
}

//------------------------> Startfrage & Anmeldeprozess
void startAnmeldung() {
  print("Bitte wähle eine der beiden Optionen aus.");
  print("1) Willst du dich neu anmelden?");
  print("2) Bin schonmal da gewesen");

  String input = stdin.readLineSync() ?? "";
  while (input != "1" && input != "2") {
    print("Ungültige Auswahl! Bitte wähle 1 oder 2.");
    input = stdin.readLineSync() ?? "";
  }

  if (input == "1") {
    erstelleBenutzer();
  } else {
    benutzerAnmeldung();
  }
}

//------------------------> Benutzer anmelden & Gruppe erstellen
void erstelleBenutzer() {
  List<Map<String, String>> benutzerDaten = [];
  Map<String, List<Map<String, String>>> gruppen = {};

  String vorname = getInput("Bitte gebe hier deinen Vornamen ein",
      isValidString, "Bitte nur Buchstaben!");
  String nachname = getInput("Bitte gebe hier deinen Nachnamen ein",
      isValidString, "Bitte nur Buchstaben!");
  String geburtsdatum = getInput(
      "Bitte gebe hier dein Geburtsdatum ein (TT.MM.JJJJ):",
      isValidDate,
      "Bitte ein gültiges Datum eingeben!");
  String mailadresse = getInput("Bitte gebe hier deine Mailadresse ein",
      isValidEmail, "Bitte eine gültige E-Mail-Adresse eingeben");
  String telefonnummer = getInput("Bitte gebe hier deine Telefonnummer ein",
      isValidPhoneNumber, "Bitte eine gültige Telefonnummer eingeben");

  Map<String, String> erstePerson = {
    "Vorname": vorname,
    "Nachname": nachname,
    "Geburtsdatum": geburtsdatum,
    "E-Mail": mailadresse,
    "Telefon": telefonnummer
  };
  benutzerDaten.add(erstePerson);

  print("\nAnmeldung erfolgreich!");
  print(
      "${erstePerson['Vorname']} ${erstePerson['Nachname']} - Geburtsdatum: ${erstePerson['Geburtsdatum']} - E-Mail: ${erstePerson['E-Mail']} - Telefon: ${erstePerson['Telefon']}");

  print("\nWillst du nun eine Gruppe anlegen?");
  print("1) Ja");
  print("2) Nein");

  String gruppenInput = stdin.readLineSync() ?? "";
  while (gruppenInput != "1" && gruppenInput != "2") {
    print("Ungültige Auswahl! Bitte 1 oder 2 wählen.");
    gruppenInput = stdin.readLineSync() ?? "";
  }

  if (gruppenInput == "1") {
    erstelleGruppe(gruppen, erstePerson);
  }
}

//------------------------> Gruppe erstellen & Personen hinzufügen
void erstelleGruppe(Map<String, List<Map<String, String>>> gruppen,
    Map<String, String> erstePerson) {
  String gruppenName = getInput("Bitte gib den Namen der Gruppe ein:",
      (s) => s.isNotEmpty, "Gruppenname darf nicht leer sein!");

  gruppen[gruppenName] = [erstePerson];
  print("Gruppe '$gruppenName' wurde erfolgreich erstellt!");
  print(
      "Der Ersteller (${erstePerson['Vorname']} ${erstePerson['Nachname']}) wurde automatisch zur Gruppe hinzugefügt.");

  while (true) {
    print(
        "\nMöchtest du eine weitere Person zur Gruppe '$gruppenName' hinzufügen?");
    print("1) Ja");
    print("2) Nein");

    String personInput = stdin.readLineSync() ?? "";
    while (personInput != "1" && personInput != "2") {
      print("Ungültige Auswahl! Bitte 1 oder 2 wählen.");
      personInput = stdin.readLineSync() ?? "";
    }

    if (personInput == "1") {
      String personVorname = getInput("Bitte gebe den Vornamen der Person ein:",
          isValidString, "Ungültige Eingabe! Nur Buchstaben erlaubt.");
      String personNachname = getInput(
          "Bitte gebe den Nachnamen der Person ein:",
          isValidString,
          "Ungültige Eingabe! Nur Buchstaben erlaubt.");
      String personGeburtsdatum = getInput(
          "Bitte gebe das Geburtsdatum der Person ein (TT.MM.JJJJ):",
          isValidDate,
          "Ungültiges Format! Bitte in der Form TT.MM.JJJJ eingeben.");

      Map<String, String> neuePerson = {
        "Vorname": personVorname,
        "Nachname": personNachname,
        "Geburtsdatum": personGeburtsdatum
      };
      gruppen[gruppenName]?.add(neuePerson);

      print(
          "Person '${neuePerson['Vorname']} ${neuePerson['Nachname']}' wurde zur Gruppe '$gruppenName' hinzugefügt!");
    } else {
      print("Okay, die Gruppenerstellung ist abgeschlossen.");
      break;
    }
  }

  zeigeGruppenMitglieder(gruppen[gruppenName]!);
}

//------------------------> Zeigt Gruppenmitglieder
void zeigeGruppenMitglieder(List<Map<String, String>> mitglieder) {
  print("______________________________________________________:");
  for (var person in mitglieder) {
    print(
        "${person['Vorname']} ${person['Nachname']} - Geburtsdatum: ${person['Geburtsdatum']}");
  }
}

//------------------------> Anmeldung mit Passwort
void benutzerAnmeldung() {
  print("Bitte Passwort eingeben:");
  String passwort = stdin.readLineSync() ?? "";
  print("Passwort eingegeben: $passwort");
}

//------------------------> Funktion zur Benutzereingabe mit Validierung
String getInput(
    String prompt, bool Function(String) validator, String errorMessage) {
  String input;
  do {
    print(prompt);
    input = stdin.readLineSync() ?? "";
    if (!validator(input)) {
      print(errorMessage);
    }
  } while (!validator(input));
  return input;
}

//------------------------> Prüft ob nur Buchstaben da sind
bool isValidString(String input) {
  return RegExp(r"^[a-zA-ZäöüÄÖÜß]+$").hasMatch(input);
}

//------------------------> Prüft die Mailadresse
bool isValidEmail(String email) {
  return RegExp(r"^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$")
      .hasMatch(email);
}

//------------------------> Prüft das Datum
bool isValidDate(String date) {
  return RegExp(r"^\d{2}\.\d{2}\.\d{4}$").hasMatch(date);
}

//------------------------> Strich Logo
void showLogo() {
  print(r"""
___________________________
>>>>>>>>>>>famka<<<<<<<<<<< 
=========================== 
Willkommen bei der Kalender
-App für die ganze Familie! 
""");
}

//------------------------> Abfrage Telefonnummer ohne RegExp
bool isValidPhoneNumber(String phone) {
  if (phone.isEmpty) return false;

  if (phone.startsWith("+")) {
    phone = phone.substring(1);
  }

  for (int i = 0; i < phone.length; i++) {
    if (!"0123456789".contains(phone[i])) {
      return false;
    }
  }

  return phone.length >= 7 && phone.length <= 15;
}
