import 'package:assignment/constants/colors.dart';
import 'package:flutter/material.dart' show TextStyle, FontWeight;

class AppStyles {
  static const TextStyle titleStyle = TextStyle(
      fontSize: 20, color: AppColors.white, fontWeight: FontWeight.bold);
  static const TextStyle headingStyle = TextStyle(
      fontSize: 18, color: AppColors.black, fontWeight: FontWeight.bold);
  static const TextStyle subHeadingStyle = TextStyle(
      fontSize: 15, color: AppColors.grey, fontWeight: FontWeight.bold);
  static const TextStyle labelStyle =
      TextStyle(fontSize: 16, color: AppColors.black);
}
