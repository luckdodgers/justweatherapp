import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:yet_another_weatherapp/styles/custom_styles.dart';

class DailyChartColumn extends StatelessWidget {
  final String _dayOfWeek;
  final int _dayOfMonth;
  final IconData _iconData;
  final int _minTemp;
  final int _maxTemp;

  DailyChartColumn(this._dayOfMonth, this._dayOfWeek, this._iconData,
      this._minTemp, this._maxTemp)
      : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            width: 50,
            height: 250,
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$_minTemp',
                  style: CustomTextStyle.dailyChart(context),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                ShaderMask(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 120),
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(show: false),
                        alignment: BarChartAlignment.center,
                        maxY: 30,
                        barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            tooltipPadding: const EdgeInsets.all(0),
                            tooltipBottomMargin: 8,
                            getTooltipItem: (
                              BarChartGroupData group,
                              int groupIndex,
                              BarChartRodData rod,
                              int rodIndex,
                            ) {
                              return BarTooltipItem(
                                rod.y.round().toString(),
                                CustomTextStyle.dailyChart(context),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: false,
                          leftTitles: SideTitles(showTitles: false),
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                y: 30,
                                color: Colors.orangeAccent.shade400,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.lightGreen.shade300,
                        Colors.amber.shade300,
                        Colors.orangeAccent.shade200
                      ],
                      stops: [
                        0.0,
                        0.3,
                        1.0,
                      ],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcATop,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(
                  '$_minTemp',
                  style: CustomTextStyle.dailyChart(context),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10))
              ],
            )),
        BoxedIcon(WeatherIcons.day_sunny),
        Text('$_dayOfWeek, $_dayOfMonth')
      ],
    );
  }
}
