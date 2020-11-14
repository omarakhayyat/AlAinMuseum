import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_panorama/flutter_panorama.dart';
import 'package:webview/tabs/explore_tab.dart';

final List<String> imgList = [
  'lib/assets/images/360Sample1.jpeg',
  'lib/assets/images/360Sample2.jpeg',
  'lib/assets/images/360Sample3.jpeg',
  'lib/assets/images/360Sample1.jpeg',
  'lib/assets/images/360Sample2.jpeg',
  'lib/assets/images/360Sample3.jpeg'
];

bool isComp = true;

class View360 extends StatefulWidget {
  final int current;
  View360({Key key, this.current}) : super(key: key);

  @override
  _View360State createState() => _View360State();
}

class _View360State extends State<View360> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterPanorama.assets(
            imgList[current], enableFullButton: true,
            enableStereoModeButton: true,
            onImageLoaded: (state) {
              print(
                  "------------------------------- ${state == 1 ? 'Loaded' : 'Failed to load1'}");
            },
            //imageType: ImageType.MEDIA_STEREO_TOP_BOTTOM,
          ),
          Positioned(
            right: 1,
            top: 40,
            child: IconButton(
              tooltip: 'Close',
              icon: Icon(
                Icons.close,
                size: 35,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            top: 40,
            child: IconButton(
              color: isComp ? Colors.orange[800] : Colors.black,
              tooltip: 'Gyroscope',
              icon: Icon(
                Icons.threed_rotation,
                size: 35,
              ),
              onPressed: () {
                setState(() {
                  isComp ? isComp = false : isComp = true;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
