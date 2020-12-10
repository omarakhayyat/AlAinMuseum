import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview/theme/app_theme.dart';
import '../tabs/nav_bar.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    bool _isDark;
    _isDark = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? true
        : false;

    //SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Container(
        height: MediaQuery.of(context).size.height,
        child: AnimatedSplashScreen(
          backgroundColor: _isDark ? Colors.black : Colors.white,
          splashTransition: SplashTransition.scaleTransition,
          splashIconSize: MediaQuery.of(context).size.longestSide,
          centered: false,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _isDark
                  ? Image.asset(
                      "lib/assets/images/AinPalaceMuseumDark.png",
                    )
                  : Image.asset(
                      "lib/assets/images/AinPalaceMuseum.png",
                    ),
              Text.rich(
                TextSpan(
                  text: "Welcome to",
                  style: TextStyle(
                    color: Color.fromARGB(255, 60, 86, 100),
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  ),
                  children: [
                    TextSpan(
                      text: "\nAl Ain Palace Museum",
                      style: TextStyle(
                        color: Color.fromARGB(255, 233, 105, 90),
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          nextScreen: NavBar(),
        ),
      ),
    );
  }
}
