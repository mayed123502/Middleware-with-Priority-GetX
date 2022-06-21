import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/main.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen")),
      body: Column(
        children: [
                const SizedBox(
            height: 200,
          ),
          Center(
            child: MaterialButton(
              // in login Screen
              onPressed: () {
                sharepref!.setString("role", "user");
                Get.offNamed("/home");
              },
              color: Colors.deepPurple,
              child: const Text("Login User"),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: MaterialButton(
              // in login Screen
              onPressed: () {
                sharepref!.setString("role", "admin");
                Get.offNamed("/admin");
              },
              color: Colors.deepPurple,
              child: const Text("Login Admin"),
            ),
          ),
        ],
      ),
    );
  }
}
