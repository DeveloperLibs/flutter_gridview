class Country {

  String name;
  String nativeName;
  String flag;
  String capital;

  Country({this.name, this.flag, this.capital,this.nativeName});

  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(
      name: json['name'] as String,
      nativeName: json['nativeName'] as String,
      flag: json['flag'] as String,
      capital: json['capital'] as String,
    );
  }
}
