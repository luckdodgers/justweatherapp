import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class DetailGridItem extends StatelessWidget {
  final String _iconCode;
  final String _label;
  final String _value;
  final String _units;

  DetailGridItem(this._iconCode, this._label, this._value, this._units)
      : super();

  BoxedIcon _getIcon() => BoxedIcon(
        WeatherIcons.fromString(_iconCode),
        size: 37.0,
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Center(
        child: Column(
          children: <Widget>[
            _getIcon(),
            Text(_label),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Text(_value, style: TextStyle(fontSize: 24)),
                ),
                Text(
                  _units,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class WindGridItem extends DetailGridItem {
  final double _directionAngle;

  WindGridItem(this._directionAngle, String label, String value)
      : super(null, label, value, '');

  @override
  BoxedIcon _getIcon() => WindIcon(degree: _directionAngle, size: 37.0);
}
