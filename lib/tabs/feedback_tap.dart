import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview/tabs/explore_tab.dart';

//TODO -- Change Feedback Tab to Settings(or More Tab, when clicked 2 options will appear feedback and Settings for dark mode) TAB, where we will add Feedback and Dark Settings
//TODO -- FIX THE LAYOUT OF FEEDBACK if the above is done, then no need for this point
class FeedBackTap extends StatefulWidget {
  const FeedBackTap({Key key}) : super(key: key);

  @override
  _FeedBackTapState createState() => _FeedBackTapState();
}

class _FeedBackTapState extends State<FeedBackTap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 80,
      child: Stack(
        children: [
          BottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            backgroundColor: Colors.transparent,
            onClosing: () => print('CLOSED'),
            builder: (context) => Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.yellowAccent, // button color
                          child: InkWell(
                            splashColor: Colors.red, // splash color
                            onTap: () {
                              print('Hate');
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.sentiment_very_dissatisfied_outlined,
                                  size: 50,
                                  color: Colors.white,
                                ), // icon
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "HATE",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.yellowAccent, // button color
                          child: InkWell(
                            splashColor: Colors.redAccent, // splash color
                            onTap: () {
                              print('Dislike');
                            }, // button pressed
                            child: Icon(
                              Icons.sentiment_dissatisfied_outlined,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "DISLIKE",
                        style: TextStyle(fontSize: 12),
                      ), // text
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.yellowAccent, // button color
                          child: InkWell(
                            splashColor: Colors.orange, // splash color
                            onTap: () {
                              print('Natural');
                            }, // button pressed
                            child: Icon(
                              Icons.sentiment_neutral_outlined,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "NEUTRAL",
                        style: TextStyle(fontSize: 12),
                      ), // text
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.yellowAccent, // button color
                          child: InkWell(
                            splashColor: Colors.greenAccent, // splash color
                            onTap: () {
                              print('Like');
                            }, // button pressed
                            child: Icon(
                              Icons.sentiment_satisfied_outlined,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "LIKE",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.yellowAccent, // button color
                          child: InkWell(
                            splashColor: Colors.green, // splash color
                            onTap: () {
                              print('Love');
                            }, // button pressed
                            child: Icon(
                              Icons.sentiment_very_satisfied_outlined,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "LOVE",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
