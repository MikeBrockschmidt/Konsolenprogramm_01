class SingleEvent {
  // Attribute
  final String singleEventId;
  final String singleEventName;
  final String singleEventLocation;
  final String singleEventDay;
  final String singleEventTime;
  final String singleEventInkl;
  final String singleEventUrl;

  // Konstruktor
  SingleEvent(
      this.singleEventId,
      this.singleEventName,
      this.singleEventLocation,
      this.singleEventDay,
      this.singleEventTime,
      this.singleEventInkl,
      this.singleEventUrl);

  // Methode - Wer ist bei Event xy dabei?
  bool isInkl(String name) {
    return singleEventInkl.contains(name);
  }
}

void main() {
  SingleEvent familienessen = SingleEvent(
    '1',
    'Familienessen',
    'Osnabrück',
    'Samstag',
    '12:00 Uhr',
    'Max, Melanie, Martha',
    'bla.de/1.jpg',
  );

  SingleEvent floete = SingleEvent(
    '2',
    'Flöte',
    'Osnabrück',
    'Mittwoch',
    '17:30 Uhr',
    'Melanie, Martha',
    'bla.de/1.jpg',
  );

  SingleEvent fussball = SingleEvent(
    '3',
    'Fußball',
    'Lüstringen Sportplatz',
    'Dienstag, Donnerstag',
    '17:00 Uhr',
    'Max, Melanie',
    'bla.de/1.jpg',
  );

  print('Wer nimmt am Flötenunterricht teil?');
  print(floete.isInkl('Melanie')
      ? 'Melanie ist dabei'
      : 'Melanie ist nicht dabei');
  print(
      floete.isInkl('Martha') ? 'Martha ist dabei' : 'Martha ist nicht dabei');
}
