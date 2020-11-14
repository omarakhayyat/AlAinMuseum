import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeTap extends StatefulWidget {
  HomeTap({Key key}) : super(key: key);

  @override
  _HomeTapState createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  static final ScrollController scrollController = ScrollController();
  scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      print('forward');
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      print('reverse');
      //videoControllerWrapper.controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(scrollListener);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    //  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return SafeArea(
      top: false,
      child: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 350,
            floating: true,
            pinned: true,
            backgroundColor: Colors.black87,
            flexibleSpace: FlexCustom(),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Qasr al-Ain or \"Al Ain Palace\", is one of the best-reinstated forts in the Abu Dhabi emirate. The museum showcases the everyday life in a ruler's fort when the late Sheikh Zayed and his family resided in the palace prior to 1966. \n\nThe Bedouin style architecture dates back to 1937 and was converted into a museum in 1998 as a main cultural and tourist attraction. The museum opened its doors to visitors in 2001, and continues to celebrate the rich history of the country and preserves its links to the present and the future.\n and continues to celebrate the rich history of the country and preserves its links to the present and the future. \nand continues to celebrate the rich history of the country and preserves its links to the present and the future. \nand continues to celebrate the rich history of the country and preserves its links to the present and the future. and continues to celebrate the rich history of the country and preserves its links to the present and the future.\n and continues to celebrate the rich history of the country and preserves its links to the present and the future. ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 119, 115, 113),
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    height: 1.92308,
                  ),
                  textAlign: TextAlign.justify,
                  strutStyle: StrutStyle(fontSize: 33),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlexCustom extends StatefulWidget {
  const FlexCustom({Key key}) : super(key: key);
  @override
  _FlexCustomState createState() => _FlexCustomState();
}

class _FlexCustomState extends State<FlexCustom> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController1 = VideoPlayerController.network(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4');

    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    //_chewieController.dispose();

    super.dispose();
  }

  bool isVideo = false;
  @override
  Widget build(BuildContext context) {
    Widget _videoDialog() {
      final size = MediaQuery.of(context).size;
      final width = size.width;
      final height = size.height;
      _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController1,
          aspectRatio: width > height ? width / height : height / width,
          allowedScreenSleep: false,
          allowFullScreen: true,
          autoInitialize: true,
          autoPlay: true,
          looping: true);

      return ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: VisibilityDetector(
            key: Key('Video'),
            onVisibilityChanged: (VisibilityInfo info) {
              if (info.visibleFraction < 1 &&
                      _HomeTapState
                              .scrollController.position.userScrollDirection
                              .toString() ==
                          ScrollDirection.reverse.toString()
                  // &&
                  //      _chewieController.isFullScreen == false
                  ) {
                _videoPlayerController1.pause();
              } else if (info.visibleFraction == 1) {
                _videoPlayerController1.play();
              }
            },
            child: Chewie(
              controller: _chewieController,
            ),
          ));
      //   FlatButton(
      //     onPressed: () {
      //       _chewieController.enterFullScreen();
      //     },
      //     child: Text('Fullscreen'),
      //   ),
      //   Row(
      //     children: <Widget>[
      //       Expanded(
      //         child: FlatButton(
      //           onPressed: () {
      //             setState(() {
      //               _chewieController.dispose();
      //               _videoPlayerController2.pause();
      //               _videoPlayerController2.seekTo(Duration(seconds: 0));
      //               _chewieController = ChewieController(
      //                 videoPlayerController: _videoPlayerController1,
      //                 aspectRatio: 3 / 2,
      //                 autoPlay: true,
      //                 looping: true,
      //               );
      //             });
      //           },
      //           child: Padding(
      //             child: Text("Video 1"),
      //             padding: EdgeInsets.symmetric(vertical: 16.0),
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: FlatButton(
      //           onPressed: () {
      //             setState(() {
      //               _chewieController.dispose();
      //               _videoPlayerController1.pause();
      //               _videoPlayerController1.seekTo(Duration(seconds: 0));
      //               _chewieController = ChewieController(
      //                 videoPlayerController: _videoPlayerController2,
      //                 aspectRatio: 3 / 2,
      //                 autoPlay: true,
      //                 looping: true,
      //               );
      //             });
      //           },
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(vertical: 16.0),
      //             child: Text("Error Video"),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      //   Row(
      //     children: <Widget>[
      //       Expanded(
      //         child: FlatButton(
      //           onPressed: () {
      //             setState(() {
      //               _platform = TargetPlatform.android;
      //             });
      //           },
      //           child: Padding(
      //             child: Text("Android controls"),
      //             padding: EdgeInsets.symmetric(vertical: 16.0),
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: FlatButton(
      //           onPressed: () {
      //             setState(() {
      //               _platform = TargetPlatform.iOS;
      //             });
      //           },
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(vertical: 16.0),
      //             child: Text("iOS controls"),
      //           ),
      //         ),
      //       )
      //     ],
      //   )
    }

    return SafeArea(
      child: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomRight,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              // child: AnimatedSwitcher(
              //   switchInCurve: Curves.fastOutSlowIn,
              //   switchOutCurve: Curves.fastOutSlowIn,
              //   duration: Duration(seconds: 1),
              //   reverseDuration: Duration(seconds: 1),
              child: isVideo
                  ? _videoDialog()
                  : Image.asset(
                      "lib/assets/images/wp3606122-ford-focus-st-wallpapers.jpg",
                      fit: BoxFit.cover,
                    ),
              // ),
            ),
            Positioned(
              bottom: 10,
              right: MediaQuery.of(context).size.width / 12,
              child: Opacity(
                opacity: 1,
                child: SizedBox.fromSize(
                  size: Size(60, 60), // button width and height
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent, // button color
                      child: InkWell(
                        splashColor: Colors.red, // splash color
                        onTap: () {
                          if (isVideo == false) {
                            _videoPlayerController1.play();
                            isVideo = true;
                          } else {
                            if (isVideo == true) {
                              _videoPlayerController1.seekTo(Duration.zero);
                              _videoPlayerController1.pause();
                              isVideo = false;
                            }
                          }
                          setState(() {});
                        }, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            isVideo == false
                                ? Icon(
                                    Icons.play_circle_filled,
                                    size: 60,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.stop,
                                    size: 60,
                                    color: Colors.white,
                                  ), // icon
                            // text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // child: Card(
                //   elevation: 10,
                //   child: SizedBox(
                //     height: 200,
                //     width: MediaQuery.of(context).size.width / 2,
                //     child:
                //   ),
                // ),
              ),
            ),
          ],
        ),
        title: Text(
          "   AL AIN PALACE\n   MUSEUM",
        ),
        titlePadding: EdgeInsets.fromLTRB(0, 0, 150, 0),
      ),
    );
  }
}
