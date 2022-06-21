// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: MaterialButton(
          // in home Scereen
          onPressed: () {
            sharepref!.clear();
            Get.offAllNamed("/");
          },
          color: Colors.deepPurple,
          child: const Text("Sign out"),
        ),
      ),
    );
  }
}
