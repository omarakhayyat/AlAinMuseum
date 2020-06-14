import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview/login.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:splashscreen/splashscreen.dart';

//TODO -- FIX SAFE AREA FOR ALL SCREEN AND CHECK ANDROID AS WELL
//TODO -- TRY TO ADD ANIMATION TO SPLASH SCREEN LIKE FADE IN
//TODO -- DELETE ALL UNUSED CODE, AND CHECK ALL PROJECT FOR UNUSED CODE
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          NavigationControls(_controller.future),
          Menu(_controller.future, () => _favorites),
        ],
      ),
      body: WebView(
        initialUrl: 'https://assets.dct.gov.ae/happiness/v2/ipad/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      floatingActionButton: _bookmarkButton(),
    );
  }

  _bookmarkButton() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              var url = await controller.data.currentUrl();
              _favorites.add(url);
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Saved $url for later reading.')),
              );
            },
            child: Icon(Icons.favorite),
          );
        }
        return Container();
      },
    );
  }
}

class Menu extends StatelessWidget {
  Menu(this._webViewControllerFuture, this.favoritesAccessor);
  final Future<WebViewController> _webViewControllerFuture;
  // TODO(efortuna): Come up with a more elegant solution for an accessor to this than a callback.
  final Function favoritesAccessor;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (!controller.hasData) return Container();
        return PopupMenuButton<String>(
          onSelected: (String value) async {
            if (value == 'Email link') {
              var url = await controller.data.currentUrl();
              await launch(
                  'mailto:?subject=Check out this cool Wikipedia page&body=$url');
            } else {
              var newUrl = await Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return FavoritesPage(favoritesAccessor());
              }));
              Scaffold.of(context).removeCurrentSnackBar();
              if (newUrl != null) controller.data.loadUrl(newUrl);
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            const PopupMenuItem<String>(
              value: 'Email link',
              child: Text('Email link'),
            ),
            const PopupMenuItem<String>(
              value: 'See Favorites',
              child: Text('See Favorites'),
            ),
          ],
        );
      },
    );
  }
}

class FavoritesPage extends StatelessWidget {
  FavoritesPage(this.favorites);
  final Set<String> favorites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite pages')),
      body: ListView(
          children: favorites
              .map((url) => ListTile(
                  title: Text(url), onTap: () => Navigator.pop(context, url)))
              .toList()),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: true),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: false),
            ),
          ],
        );
      },
    );
  }

  navigate(BuildContext context, WebViewController controller,
      {bool goBack: false}) async {
    bool canNavigate =
        goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text("No ${goBack ? 'back' : 'forward'} history item")),
      );
    }
  }
}

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
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds:LoginPage(),
        title: Text.rich(
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
        image: Image.asset("lib/assets/images/AinPalaceMuseum.png"),
        photoSize: MediaQuery.of(context).size.height / 4,
        backgroundColor: Colors.white,
        loaderColor: Colors.grey,
        loadingText: Text(
          'Loading',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}


