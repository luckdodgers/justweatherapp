import 'package:flutter/material.dart';
import 'package:yet_another_weatherapp/components/weather_details_grid_elements.dart';

class DetailsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, top: 25, right: 10, bottom: 20),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: <Widget>[
            DetailGridItem(
                'wi-thermometer', 'Відчувається як', '28', '\u00B0c'),
            DetailGridItem('wi-humidity', 'Вологість', '53', '%'),
            DetailGridItem('wi-barometer', 'Тиск', '757', 'mm'),
            DetailGridItem('wi-strong-wind', 'Швідкисть вітру', '4', 'м/c'),
            WindGridItem(55, 'Напрямок вітру', 'ПС'),
            DetailGridItem('wi-smog', 'Хмарність', '21', '%')
          ],
          shrinkWrap: true,
        ));
  }
}
