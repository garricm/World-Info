class Country {
  String name;
  String capital;
  String code;
  String region;
  int population;
  String flag;

  Country.min({this.name, this.capital, this.code});

  Country(
      {this.name,
      this.capital,
      this.code,
      this.region,
      this.population,
      this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["name"] as String,
      capital: json["capital"] as String,
      code: json["alpha3Code"] as String,
      region: json["region"] as String,
      population: json["population"] as int,
      flag: json["flag"] as String,
    );
  }
}
