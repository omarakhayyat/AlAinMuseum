import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview/tabs/nav_bar.dart';
import 'package:webview/theme/app_theme.dart';

import 'Widgets/splash_screen_page.dart';

//TODO -- FIX SAFE AREA FOR ALL SCREEN AND CHECK ANDROID AS WELL
//TODO -- DELETE ALL UNUSED CODE, AND CHECK ALL PROJECT FOR UNUSED CODE
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al Ain Palace Museum',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: NavBar(),
    );
  }
}
