class CountryData {
  final int stdCode;
  final String flagIcon;

  CountryData({ required this.stdCode, required this.flagIcon});

  static List<CountryData> countryDataList = [
    CountryData(stdCode: 1, flagIcon: '🇺🇸'),
    CountryData(stdCode: 44, flagIcon: '🇬🇧'),
    CountryData(stdCode: 61, flagIcon: '🇦🇺'),
    // Add more countries here
  ];

}