import 'package:flutter/material.dart';

import 'Widgets/splash_screen_page.dart';

//TODO -- FIX SAFE AREA FOR ALL SCREEN AND CHECK ANDROID AS WELL
//TODO -- DELETE ALL UNUSED CODE, AND CHECK ALL PROJECT FOR UNUSED CODE
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al Ain Palace Museum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
    );
  }
}
