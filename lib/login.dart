import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview/Widgets/explore_tab.dart';
import 'package:webview/Widgets/feedback_tap.dart';
import 'package:webview/Widgets/home.dart';
import 'package:webview/main.dart';

import 'Widgets/360_view.dart';
import 'Widgets/map_tab.dart' ;
import 'functions/apiLoginFunction.dart';
import 'functions/getSavedToken.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    super.initState();
  }

  int _selectedIndex = 0;
  int _prevIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    // Text(
    //   'Index 1: Likes',
    //   style: optionStyle,
    // ),
    MapTab(),
    ExploreTab(),
    // Image.asset(
    //   "lib/assets/images/mask-group-1-4.png",
    //   height: 900,
    //   width: 700,
    //   fit: BoxFit.cover,
    // ),
    // Text(
    //   'Index 2: Search',
    //   style: optionStyle,
    // ),
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
          decoration: BoxDecoration(color: Colors.black, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  duration: Duration(milliseconds: 800),
                  tabBackgroundColor: Colors.orange[800],
                  color: Colors.orange[800],
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
                    setState(() {
                      _selectedIndex != 3
                          ? _prevIndex = _selectedIndex
                          : _selectedIndex = _prevIndex;
                      _selectedIndex != 3
                          ? _selectedIndex = index
                          : Navigator.pop(context);
                    });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
//     return Scaffold(
//       key: _scaffoldKey,
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Text(
//               'Login',
//               style: TextStyle(
//                   color: Colors.orange[900],
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Form(
//               autovalidate: false,
//               key: _formKey,
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(100, 0, 100, 30),
//                 child: Column(
//                   children: <Widget>[
//                     TextFormField(
//                       controller: userControl,
//                       focusNode: _emailAddressNode,
//                       textInputAction: TextInputAction.next,
//                       onFieldSubmitted: (value) {
//                         _emailAddressNode.unfocus();
//                         FocusScope.of(context).requestFocus(_passwordNode);
//                       },
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.email),
//                         labelText: 'Username',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(32),
//                           ),
//                         ),
//                       ),

//                       validator: (value) {
//                         if (value.isEmpty) return 'Please enter username';
//                       },
//                       //onChanged: (value) => _emailKey.currentState.validate(),
//                     ),
//                     // TextFormField(
//                     //   decoration: InputDecoration(
//                     //     hintText: 'Username',
//                     //   ),
//                     //   validator: (value) {
//                     //     if (value.isEmpty) {
//                     //       return 'Please enter some text';
//                     //     }
//                     //     return null;
//                     //   },
//                     // ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       controller: passControl,
//                       focusNode: _passwordNode,
//                       onFieldSubmitted: (value) async {
//                         _passwordNode.unfocus();
//                         if (_formKey.currentState.validate()) {
//                           // If the form is valid, display a Snackbar.
//                           _scaffoldKey.currentState.showSnackBar(
//                             SnackBar(
//                               content: Text('Processing Data'),
//                             ),
//                           );
//                           requestLoginAPI(
//                               context, userControl.text, passControl.text);
//                         }
//                         print(await getSavedToken());
//                         print('test on field submit this can be a function');
//                       },
//                       textInputAction: TextInputAction.go,
//                       obscureText: _obscureText,
//                       keyboardType: TextInputType.visiblePassword,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(32)),
//                         ),
//                         hintText: 'Password',
//                         labelText: 'password',
//                         prefixIcon: Icon(Icons.vpn_key),
//                         suffixIcon: IconButton(
//                           icon: Icon(_obscureText
//                               ? Icons.visibility
//                               : Icons.visibility_off),
//                           onPressed: () => setState(
//                             () {
//                               _obscureText = !_obscureText;
//                             },
//                           ),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value.isEmpty) return 'Please Enter Password';
//                       },
//                       autovalidate: _autoValidate,
//                     ),

//                     // TextFormField(
//                     //   decoration: InputDecoration(hintText: 'Password'),
//                     //   obscureText: true,
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     RaisedButton(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30)),
//                       child: Text('Login'),
//                       onPressed: () async {
//                         SharedPreferences preferences =
//                             await SharedPreferences.getInstance();

//                         if (_formKey.currentState.validate()) {
//                           // If the form is valid, display a Snackbar.
//                           _scaffoldKey.currentState.showSnackBar(
//                             SnackBar(
//                               content: Text('Processing Data'),
//                             ),
//                           );
//                           requestLoginAPI(
//                               context, userControl.text, passControl.text);
//                         }
//                         print(await getSavedToken());
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
