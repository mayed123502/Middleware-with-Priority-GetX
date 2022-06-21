// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:learn_getx/main.dart';

class SuperMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  bool myvar = true;
  @override
  RouteSettings? redirect(String? route) {
    if (myvar) {
      return const RouteSettings(
        name: "/super",
      );
    }
    return null;
  }
}
