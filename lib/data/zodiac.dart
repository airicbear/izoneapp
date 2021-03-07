class Zodiac {
  static bool isAries(DateTime date) =>
      _afterBefore(date, DateTime.march, 21, DateTime.april, 19);
  static bool isTaurus(DateTime date) =>
      _afterBefore(date, DateTime.april, 20, DateTime.may, 20);
  static bool isGemini(DateTime date) =>
      _afterBefore(date, DateTime.may, 21, DateTime.june, 21);
  static bool isCancer(DateTime date) =>
      _afterBefore(date, DateTime.june, 22, DateTime.july, 22);
  static bool isLeo(DateTime date) =>
      _afterBefore(date, DateTime.july, 23, DateTime.august, 22);
  static bool isVirgo(DateTime date) =>
      _afterBefore(date, DateTime.august, 23, DateTime.september, 22);
  static bool isLibra(DateTime date) =>
      _afterBefore(date, DateTime.september, 23, DateTime.october, 23);
  static bool isScorpius(DateTime date) =>
      _afterBefore(date, DateTime.october, 24, DateTime.november, 21);
  static bool isSagittarius(DateTime date) =>
      _afterBefore(date, DateTime.november, 22, DateTime.december, 21);
  static bool isCapricorn(DateTime date) =>
      _afterBefore(date, DateTime.december, 22, DateTime.january, 19);
  static bool isAquarius(DateTime date) =>
      _afterBefore(date, DateTime.january, 20, DateTime.february, 18);
  static bool isPisces(DateTime date) =>
      _afterBefore(date, DateTime.february, 19, DateTime.march, 20);

  // ♈ Aries (Ram): March 21–April 19
  // ♉ Taurus (Bull): April 20–May 20
  // ♊ Gemini (Twins): May 21–June 21
  // ♋ Cancer (Crab): June 22–July 22
  // ♌ Leo (Lion): July 23–August 22
  // ♍ Virgo (Virgin): August 23–September 22
  // ♎ Libra (Balance): September 23–October 23
  // ♏ Scorpius (Scorpion): October 24–November 21
  // ♐ Sagittarius (Archer): November 22–December 21
  // ♑ Capricornus (Goat): December 22–January 19
  // ♒ Aquarius (Water Bearer): January 20–February 18
  // ♓ Pisces (Fish): February 19–March 20
  static String zodiac(DateTime date) {
    if (isAries(date)) return '♈ Aries';
    if (isTaurus(date)) return '♉ Taurus';
    if (isGemini(date)) return '♊ Gemini';
    if (isCancer(date)) return '♋ Cancer';
    if (isLeo(date)) return '♌ Leo';
    if (isVirgo(date)) return '♍ Virgo';
    if (isLibra(date)) return '♎ Libra';
    if (isScorpius(date)) return '♏ Scorpius';
    if (isSagittarius(date)) return '♐ Sagittarius';
    if (isCapricorn(date)) return '♑ Capricorn';
    if (isAquarius(date)) return '♒ Aquarius';
    if (isPisces(date)) return '♓ Pisces';
    assert(false, 'Date $date did not correspond to a zodiac sign.');
    return 'No zodiac';
  }

  static bool _afterBefore(
    DateTime date,
    int month1,
    int day1,
    int month2,
    int day2,
  ) {
    DateTime after =
        DateTime(date.year + (month1 > month2 ? -1 : 0), month1, day1 - 1);
    DateTime before = DateTime(date.year, month2, day2 + 1);
    assert(after.isBefore(before), '$after is not before $before.');
    return date.isAfter(after) && date.isBefore(before);
  }
}
