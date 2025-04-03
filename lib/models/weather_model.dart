class WeatherModel {
  final int dt;
  final double temp; //olindi
  final String main; //olindi
  final String description; //olindi
  final String icon; //olindi
  final double speed; //olindi
  final double feelsLike; //olindi

  WeatherModel({
    required this.dt,
    required this.temp,
    required this.main,
    required this.description,
    required this.icon,
    required this.speed,
    required this.feelsLike,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> json) {
    return WeatherModel(
      dt: json["dt"],
      temp: (json["main"]["temp"] as num).toDouble(),
      main: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      icon: json["weather"][0]["icon"],
      speed: (json["wind"]["speed"] as num).toDouble(),
      feelsLike: (json["main"]["feels_like"] as num).toDouble(),
    );
  }
}
