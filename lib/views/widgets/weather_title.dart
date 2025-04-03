import 'package:flutter/material.dart';
import 'package:weather/views/widgets/info_card.dart';

class WeatherTitle extends StatelessWidget {
  final String mainIcon;
  final String main;
  final String temp;
  final String description;
  final String windSpeed;
  final String feelsLike;
  final String cityName;
  final String date;
  const WeatherTitle({
    super.key,
    required this.mainIcon,
    required this.main,
    required this.temp,
    required this.description,
    required this.windSpeed,
    required this.feelsLike,
    required this.cityName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              "$cityName, ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            Text(
              "country",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            gradient: LinearGradient(
              colors: [
                Colors.black.withValues(alpha: 0.8),
                Colors.purple,
                Colors.pinkAccent,
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.network(
                "https://openweathermap.org/img/wn/$mainIcon@2x.png",
              ),
              Text(date),
              Text(main, style: TextStyle(color: Colors.white, fontSize: 25)),
              Text(
                description,
                style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
              ),
              Text(
                "$temp °",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true, // GridView o‘z hajmiga moslashadi
                crossAxisCount: 2, // 2 ta ustun
                childAspectRatio: 2,
                crossAxisSpacing: 0, // Ustun orasidagi bo‘shliq
                mainAxisSpacing: 0, // Qator orasidagi bo‘shliq
                children: [
                  InfoCard(
                    icon: Icons.air,
                    title: "WIND",
                    value: "$windSpeed km/j",
                  ),
                  InfoCard(
                    icon: Icons.thermostat,
                    title: "FEELS LIKE",
                    value: "$feelsLike °",
                  ),
                  InfoCard(icon: Icons.wb_sunny, title: "INDEX UV", value: "2"),
                  InfoCard(
                    icon: Icons.speed,
                    title: "PRESSURE",
                    value: "1014 mbar",
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
