


class WeatherData{
  final double temperatureC;
  final double temperatureF;
  final String condition;

  WeatherData({
    this.temperatureC = 0,
    this.temperatureF = 0,
    this.condition = "Sunny",
});
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperatureC: json['current']['temp_c'],
      temperatureF: json['current']['temp_f'],
      condition: json['current']['condition']['text'],
    );
  }

}
