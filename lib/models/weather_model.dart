class WeatherData {
  final DateTime date;
  final String name;
  final int temp;
  final int tempMin;
  final int tempMax;
  final String main;
  final String icon;

  WeatherData(this.date, this.name, this.temp, this.tempMin, this.tempMax,
      this.main, this.icon);

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false),
      json['name'],
      json['main']['temp'].toInt(),
      json['main']['temp_min'].toInt(),
      json['main']['temp_max'].toInt(),
      json['weather'][0]['description'],
      json['weather'][0]['icon'],
    );
  }
}
