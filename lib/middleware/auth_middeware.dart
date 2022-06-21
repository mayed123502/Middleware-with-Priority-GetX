// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:learn_getx/main.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharepref!.getString("role") == "user") {
      return const RouteSettings(
        name: "/home",
      );
    }
    if (sharepref!.getString("role") == "admin") {
      return const RouteSettings(
        name: "/admin",
      );
    }
  }
}
