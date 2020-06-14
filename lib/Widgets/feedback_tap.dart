import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//TODO -- FIX THE FEEDBACK PAGE TO BE A POPUP FROM BUTTOM OF THE CURRENT PAGE BUT AT THE SAME TIME BE FIXED ON BOTTOM NAVIGATOR BAR
//TODO -- FIX THE LAYOUT OF FEEDBACK
class FeedBackTap extends StatefulWidget {
  const FeedBackTap({Key key}) : super(key: key);

  @override
  _FeedBackTapState createState() => _FeedBackTapState();
}

class _FeedBackTapState extends State<FeedBackTap> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      //backgroundColor: Colors.black,
      enableDrag: true,
      onClosing: () => print('CLOSED'),
      builder: (context) => Container(clipBehavior: Clip.hardEdge,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.grey[300], spreadRadius: 5),
          ],
         // color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Column(
            //mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ClipOval(
                          child: Material(
                            color: Colors.yellow, // button color
                            child: InkWell(
                              splashColor: Colors.red, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.sentiment_very_dissatisfied,
                                    size: 70,
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
                            color: Colors.yellow, // button color
                            child: InkWell(
                              splashColor: Colors.redAccent, // splash color
                              onTap: () {}, // button pressed
                              child: Icon(
                                Icons.sentiment_dissatisfied,
                                size: 70,
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
                            color: Colors.yellow, // button color
                            child: InkWell(
                              splashColor: Colors.orange, // splash color
                              onTap: () {}, // button pressed
                              child: Icon(
                                Icons.sentiment_neutral,
                                size: 70,
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
                            color: Colors.yellow, // button color
                            child: InkWell(
                              splashColor: Colors.greenAccent, // splash color
                              onTap: () {}, // button pressed
                              child: Icon(
                                Icons.sentiment_satisfied,
                                size: 70,
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
                            color: Colors.yellow, // button color
                            child: InkWell(
                              splashColor: Colors.green, // splash color
                              onTap: () {}, // button pressed
                              child: Icon(
                                Icons.sentiment_very_satisfied,
                                size: 70,
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
            ]),
      ),
    );
  }
}
