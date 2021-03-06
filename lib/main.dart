// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:learn_getx/views/admin.dart';
import 'package:learn_getx/views/home.dart';
import 'package:learn_getx/views/login.dart';
import 'package:learn_getx/views/super.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'middleware/auth_middeware.dart';
import 'middleware/super_middleware.dart';

SharedPreferences? sharepref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharepref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const Login(),
          middlewares: [AuthMiddleWare(), SuperMiddleWare()],
        ),
        GetPage(name: "/home", page: () => Home()),
        GetPage(name: "/admin", page: () => Admin()),
        GetPage(name: "/super", page: () => Super()),
      ],
    );
  }
}
