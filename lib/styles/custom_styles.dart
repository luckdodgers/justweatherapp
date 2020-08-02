import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextStyle{
  static TextStyle regularLabel(BuildContext context){
    return TextStyle(
      fontSize: 14,
      color: Colors.black,
    );
  }

  static TextStyle dailyChart(BuildContext context){
    return TextStyle(
      fontSize: 17,
      color: Colors.black87,
    );
  }
}