import 'dart:io';

void main() {
  int punkte = 0; // Speichert die Punktzahl

  print("Willkommen zum MusikQuiz Best Of Three!");
  print("Beantworte die Fragen mit 1, 2 oder 3.");
  print("---------------------------------------");

  // <------Frage 1
  print("\n Wie viele Mitglieder hatte die MusikBand Genesis Anfang 1974?");
  print("1) 4");
  print("2) 5");
  print("3) 3");
  stdout.write("Deine Antwort: ");
  String antwort1 = stdin.readLineSync() ?? "";
  if (antwort1 == "2") {
    print(
        "Richtig! Anfang 1974 bestand die Band Genesis aus fünf Mitgliedern. Peter Gabriel, Tony Banks, Mike Rutherford, Phil Collins, Steve Hackett");
    punkte++;
  } else {
    print(
        "Falsch! Die richtige Antwort ist: 2) Anfang 1974 bestand die Band Genesis aus fünf Mitgliedern. Peter Gabriel, Tony Banks, Mike Rutherford, Phil Collins, Steve Hackett");
  }

  // <------Frage 2
  print(
      "\n Wann veröffentlichen die Beatles ihre erste Nummer 1 Single in den USA??");
  print("1) 1963");
  print("2) 1970");
  print("3) 1985");
  stdout.write("Deine Antwort: ");
  String antwort2 = stdin.readLineSync() ?? "";
  if (antwort2 == "1") {
    print(
        "Richtig! Ihre erste Single Love Me Do erschien im Oktober 1962. 1963 erscheint ihre Single I Want to Hold Your Hand, die Anfang 1964 auch in den USA zum Megahit wurde. Damit schaffen sie den weltweiten Durchbruch.");
    punkte++;
  } else {
    print(
        "Falsch! Die richtige Antwort ist: 2) 1963 erscheint ihre Single I Want to Hold Your Hand, die Anfang 1964 auch in den USA zum Megahit wurde.");
  }

  // <------Frage 3**
  print("\n Wie hieß der Sänger der 80er Jahre MusikBand Talk Talk??");
  print("1) Mark Hollis");
  print("2) Mick Jagger");
  print("3) Steve Hogarth");
  stdout.write("Deine Antwort: ");
  String antwort3 = stdin.readLineSync() ?? "";
  if (antwort3 == "1") {
    print(
        "Richtig! Talk Talk waren eine britische Band aus London, die sich im Laufe der 1980er Jahre von recht simplem New Wave zu immer experimentellerem Art-Pop entwickelte. Sie bestand aus dem Sänger und Multiinstrumentalisten Mark Hollis");
    punkte++;
  } else {
    print(
        "Falsch! Die richtige Antwort ist: 1) Talk Talk waren eine britische Band aus London, die sich im Laufe der 1980er Jahre von recht simplem New Wave zu immer experimentellerem Art-Pop entwickelte. Sie bestand aus dem Sänger und Multiinstrumentalisten Mark Hollis");
  }

  print("\n Quiz beendet! Du hast $punkte von 3 Punkten erreicht.");

  if (punkte == 3) {
    print("Perfekt! Du bist ein Musik Nerd!");
  } else if (punkte == 2) {
    print("Gut gemacht! Der Weg zum Musik Nerd ist nicht weit.");
  } else if (punkte == 1) {
    print("Naja, man kann nicht alles Wissen!");
  } else {
    print("Oh nein! Das war nicht dein Tag. Versuch es nochmal!");
  }
}
