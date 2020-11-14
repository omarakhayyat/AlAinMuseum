import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:page_transition/src/enum.dart';

import '../tabs/nav_bar.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        home: Container(
      height: MediaQuery.of(context).size.height,
      child: SplashScreenWidget(),
    ));
  }
}

class SplashScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: MediaQuery.of(context).size.longestSide,
        centered: false,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
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
        nextScreen: NavBar());

    // return SplashScreen(
    //   seconds: 3,
    //   routeName: "/",
    //   navigateAfterSeconds: NavBar(),
    //   title: Text.rich(
    //     TextSpan(
    //       text: "Welcome to",
    //       style: TextStyle(
    //         color: Color.fromARGB(255, 60, 86, 100),
    //         fontWeight: FontWeight.w400,
    //         fontSize: 30,
    //       ),
    //       children: [
    //         TextSpan(
    //           text: "\nAl Ain Palace Museum",
    //           style: TextStyle(
    //             color: Color.fromARGB(255, 233, 105, 90),
    //             fontWeight: FontWeight.w400,
    //             fontSize: 25,
    //           ),
    //         )
    //       ],
    //     ),
    //     textAlign: TextAlign.center,
    //   ),
    //   image: Image.asset("lib/assets/images/AinPalaceMuseum.png"),
    //   photoSize: MediaQuery.of(context).size.height / 4,
    //   backgroundColor: Colors.white,
    //   loaderColor: Colors.grey,
    //   loadingText: Text(
    //     'Loading',
    //     style: TextStyle(color: Colors.white),
    //   ),
    // );
  }
}
