import 'package:flutter/material.dart';
import 'package:weather/controllers/weather_controller.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/views/widgets/weather_title.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final weatherController = WeatherController();
  List<WeatherModel> weather = [];
  bool isLoading = false;
  final TextEditingController _editingController = TextEditingController();
  String city = "Tashkent";

  @override
  void initState() {
    super.initState();
    fetchWeather(city);
  }

  void fetchWeather(String cityName) {
    setState(() {
      isLoading = true;
    });

    weatherController
        .getWeather(cityName)
        .then((weatherData) {
          setState(() {
            weather = weatherData;
            isLoading = false;
          });
        })
        .catchError((error) {
          setState(() {
            isLoading = false;
          });
        });
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextFormField(
          controller: _editingController,
          decoration: InputDecoration(
            labelText: "Shahar nomini kiriting",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon: IconButton(
              onPressed: () {
                String inputCity = _editingController.text.trim();
                if (inputCity.isNotEmpty) {
                  fetchWeather(inputCity);
                }
              },
              icon: Icon(Icons.send),
            ),
          ),
        ),
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : weather.isEmpty
              ? Center(child: Text("Ob-havo ma'lumotlari yo'q"))
              : ListView.builder(
                itemCount: weather.length,
                itemBuilder: (ctx, index) {
                  final weatherOne = weather[index];

                  return WeatherTitle(
                    mainIcon: weatherOne.icon,
                    main: weatherOne.main,
                    description: weatherOne.description,
                    windSpeed: weatherOne.speed.toStringAsFixed(1),
                    temp: ((weatherOne.temp) - 273).toDouble().toStringAsFixed(
                      1,
                    ),
                    feelsLike: ((weatherOne.feelsLike) - 273)
                        .toDouble()
                        .toStringAsFixed(1),
                    cityName: city,
                  );
                },
              ),
    );
  }
}
