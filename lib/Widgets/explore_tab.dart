import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:webview/Widgets/360_view.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<String> txtList = [
  "\nImage 1 Qasr al-Ain or \"Al Ain Palace\", is one of the best-reinstated forts in the Abu Dhabi emirate. The museum showcases the everyday life in a ruler's fort when the late Sheikh Zayed and his family resided in the palace prior to 1966. The Bedouin style architecture dates back to 1937 and was converted into a museum in 1998 as a main cultural and tourist attraction.",
  "\nImage 2 Qasr al-Ain or \"Al Ain Palace\", is one of the best-reinstated forts in the Abu Dhabi emirate. The museum showcases the everyday life in a ruler's fort when the late Sheikh Zayed and his family resided in the palace prior to 1966. The Bedouin style architecture dates back to 1937 and was converted into a museum in 1998 as a main cultural and tourist attraction.",
  "\nImage 3 Qasr al-Ain or \"Al Ain Palace\", is one of the best-reinstated forts in the Abu Dhabi emirate. The museum showcases the everyday life in a ruler's fort when the late Sheikh Zayed and his family resided in the palace prior to 1966. The Bedouin style architecture dates back to 1937 and was converted into a museum in 1998 as a main cultural and tourist attraction.",
  "\nImage 4 Qasr al-Ain or \"Al Ain Palace\", is one of the best-reinstated forts in the Abu Dhabi emirate. The museum showcases the everyday life in a ruler's fort when the late Sheikh Zayed and his family resided in the palace prior to 1966. The Bedouin style architecture dates back to 1937 and was converted into a museum in 1998 as a main cultural and tourist attraction.",
  "\nImage 5 Qasr al-Ain or \"Al Ain Palace\", is one of the best-reinstated forts in the Abu Dhabi emirate. The museum showcases the everyday life in a ruler's fort when the late Sheikh Zayed and his family resided in the palace prior to 1966. The Bedouin style architecture dates back to 1937 and was converted into a museum in 1998 as a main cultural and tourist attraction.",
  "\nImage 6 Qasr al-Ain or \"Al Ain Palace\", is one of the best-reinstated forts in the Abu Dhabi emirate. The museum showcases the everyday life in a ruler's fort when the late Sheikh Zayed and his family resided in the palace prior to 1966. The Bedouin style architecture dates back to 1937 and was converted into a museum in 1998 as a main cultural and tourist attraction."
];
final List<String> txtTitleList = [
  'Title Image 1',
  'Title Image 2',
  'Title Image 3',
  'Title Image 4',
  'Title Image 5',
  'Title Image 6'
];

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            //TODO -- CHECK THE IMAGE CLIP AND SIZE TO MATCH THE UI
            //TODO -- FIX THE BUTTONS UNDERNEATH THE IMAGES
            //TODO -- ADD READ MORE INKWELL OR FLAT BUTTON
            borderRadius: BorderRadius.circular(55), //image cliprrect inside
            child: Image.network(
              i,
              fit: BoxFit.cover,
              width: 800.0,
              height: 800,
            ), //image height and width inside
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: <Widget>[
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(8),
                //   child: Container(
                //     width: 190,
                //     alignment: Alignment.center,
                //     color: Colors.orange[800],
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         FlatButton(
                //           onPressed: () {},
                //           child: Column(
                //             children: <Widget>[
                //               Icon(Icons.directions_walk, color: Colors.white),
                //               Text(
                //                 'Direction',
                //                 style: TextStyle(color: Colors.white),
                //               ),
                //             ],
                //           ),
                //         ),
                //         FlatButton(
                //           child: Column(
                //             children: <Widget>[
                //               Icon(
                //                 Icons.threesixty,
                //                 color: Colors.white,
                //               ),
                //               Text(
                //                 '360 View',
                //                 style: TextStyle(color: Colors.white),
                //               ),
                //             ],
                //           ),
                //           onPressed: () {
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                // Text(
                //   'No. $index image',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

int current = 0;

class ExploreTab extends StatefulWidget {
  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  void dispose() {
    current = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Manually operated Carousel
    final CarouselSlider manualCarouselDemo = CarouselSlider(
      items: child,
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        height: 300,
        onPageChanged: (index, reason) {
          setState(() {
            current = index;
          });
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black87,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Stack(
              children: [
                //Text('Manuell Carousel'),
                manualCarouselDemo,
                Positioned(
                  bottom: 0,
                  right: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 190,
                      alignment: Alignment.center,
                      color: Colors.orange[800],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.directions_walk,
                                    color: Colors.white),
                                Text(
                                  'Direction',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.threesixty,
                                  color: Colors.white,
                                ),
                                Text(
                                  '360 View',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            onPressed: () {
                              print(current);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => View360(
                                  current: current,
                                ),
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              strutStyle: StrutStyle(fontSize: 33),
              text: TextSpan(
                  text: txtTitleList[current],
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                  ),
                  children: [
                    TextSpan(
                      text: txtList[current],
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        height: 1.92308,
                        color: Color.fromARGB(255, 119, 115, 113),
                      ),
                    ),
                    TextSpan(
                      text: txtList[current],
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        height: 1.92308,
                        color: Color.fromARGB(255, 119, 115, 113),
                      ),
                    ),
                    TextSpan(
                      text: txtList[current],
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        height: 1.92308,
                        color: Color.fromARGB(255, 119, 115, 113),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
