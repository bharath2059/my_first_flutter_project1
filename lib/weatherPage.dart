import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/services/weatherData.dart';
import 'package:my_first_flutter_project/services/weatherService.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String placeController = "";
  WeatherService weatherService = WeatherService();
  WeatherData weatherData = WeatherData();

  String currentWeather = "";
  String tempC = "";
  String tempF = "";

  Future<void> getWeather(String place) async {
    print(place);
    weatherData = await weatherService.getWeatherData(place);

    setState(() {
      currentWeather = weatherData.condition;
      tempF = weatherData.temperatureF.toString();
      tempC = weatherData.temperatureC.toString();
    });
    print(weatherData.temperatureC);
    print(weatherData.temperatureF);
    print(weatherData.condition);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(40),
            children: [
              ListTile(
                title: Text("Home",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber)),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text(
                  "Weather",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/weather');
                },
              ),
              ListTile(
                title: const Text(
                  "Calculator",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/calc');
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (text) {
                  placeController = text;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'enter location'),
              ),
            ),
            ElevatedButton(
                onPressed: () => {
                      currentWeather = "",
                      if (placeController.toString().isNotEmpty)
                        {getWeather(placeController.toString())}
                    },
                child: const Text(
                  "Fetch",
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Weather Conditon: $currentWeather',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Text('Temperature in celsius : $tempC',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                  Text('Temperature in farahenit : $tempF',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
