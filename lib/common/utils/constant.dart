import 'package:flutter/material.dart';

class AppConstant {
  /// Flavor
  static const String development = 'development';
  static const String staging = 'staging';
  static const String production = 'production';
  static const String test = 'test';

  /// Screen Util Size
  static const double width = 375;
  static const double height = 897;

  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}

enum StateEnum { initial, success, failure }
