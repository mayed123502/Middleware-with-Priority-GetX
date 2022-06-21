// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:learn_getx/views/home.dart';
import 'package:learn_getx/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'middleware/auth_middeware.dart';

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
          page: () =>  const Login(),
          middlewares: [AuthMiddleWare()],
        ),
        GetPage(name: "/home", page: () => Home()),
      ],
    );
  }
}
