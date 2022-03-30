import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koshi_app/binding/controller_binding.dart';
import 'package:koshi_app/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialBinding: ControllerBinding(),
        home: const HomeView());
  }
}
