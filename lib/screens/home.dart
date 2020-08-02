import 'package:flutter/material.dart';
import 'package:yet_another_weatherapp/constants.dart';
import 'package:yet_another_weatherapp/styles/custom_styles.dart';
import 'package:yet_another_weatherapp/components/weather_details_grid.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:yet_another_weatherapp/components/daily_weather_chart_column.dart';
import 'package:yet_another_weatherapp/services/icon_converter.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [bg_gradient_begin, bg_gradient_end]),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(
              child: Text(
            '',
            style: CustomTextStyle.regularLabel(context),
          )),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: <Widget>[
            Center(child: Text('${32}\u00B0c', style: TextStyle(fontSize: 60))),
            Center(
              child: Row(
                children: <Widget>[
                  BoxedIcon(WeatherIcons.day_sunny),
                  Text('Сонячно', style: TextStyle(fontSize: 30)),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Center(
              child: DetailsGrid(),
            ),
            Container(
                alignment: Alignment.center,
                child: DailyChartColumn(1, 'Нд',
                        '800'.getWeatherIcon(1596272100, 1606272100), 15, 28)),
          ],
        ),
      ),
    ]);
  }
}
