import 'package:advanced_arabic_mina_course/presentation%20layers/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../presentation layers/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // const MyApp(
  //     {super.key}); // this is constractor is defualt constractor and this is will import in every instance import from this file or this class to any class or file in app

//this is named constractor 
  const MyApp._();

  static const MyApp _instance = MyApp._();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RoutesGenerator.getRoute,
      initialRoute: RoutesManager.splashRoute,
    );
  }
}
