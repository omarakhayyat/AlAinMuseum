import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:webview/tabs/home_tap.dart';
import 'explore_tab.dart';
import 'feedback_tap.dart';
import 'map_tab.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  int _prevIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeTap(),
    MapTab(),
    ExploreTab(),
    null,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        bottomSheet: _selectedIndex == 3 ? FeedBackTap() : null,
        body: _selectedIndex == 3
            ? _widgetOptions.elementAt(_prevIndex)
            : _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          // decoration: BoxDecoration(
          //   color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          //   // boxShadow: [BoxShadow(blurRadius: 0, color: Colors.yellow)],
          // ),
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
              child: GNav(
                gap: 8,
                activeColor: Theme.of(context)
                    .bottomNavigationBarTheme
                    .backgroundColor, //Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor:
                    Theme.of(context).primaryColor, //Colors.orange[800],
                color: Theme.of(context).primaryColor, //Colors.orange[800],
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.map,
                    text: 'Map',
                  ),
                  GButton(
                    icon: Icons.explore,
                    text: 'Explore',
                  ),
                  GButton(
                    icon: Icons.feedback,
                    text: 'Feedback',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(
                    () {
                      _selectedIndex != 3
                          ? _prevIndex = _selectedIndex
                          : _selectedIndex = _prevIndex;
                      _selectedIndex != 3
                          ? _selectedIndex = index
                          : Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
