import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mass_user_commoncode/landing.dart';



void main() {
  runApp(MyAPP());
}

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MassUserCode",
     /* theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black),
        primarySwatch: Colors.red,
      ),*/
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _splashScreen();
  }
}

class _splashScreen extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        child: new Column(children: <Widget>[
          /* Divider(
            height: 240.0,
            color: Colors.black,
          ),*/

          new Image.asset(
            'assets/splash.png',

            fit: BoxFit.fitHeight,
            repeat: ImageRepeat.noRepeat,
          ),
          /* Divider(
            height: 105.2,
            color: Colors.white,
          ),*/
        ]),
      ),
    );
  }


    void navigationPage() {
      print('@@+navigationPage');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LandingScreen(text: 'Hello',)));
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('@@FirstTimewhenCalled');
    startTime();
  }
}


/*

*/
/*
import 'package:flutter/material.dart';



void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  *//*

*/
/*  new Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginValidation()),
        ));*//*
*/
/*

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        child: new Column(children: <Widget>[
          *//*

*/
/* Divider(
            height: 240.0,
            color: Colors.black,
          ),*//*
*/
/*


          new Image.asset(
            'assets/splash.png',

            fit: BoxFit.fitHeight,
            repeat: ImageRepeat.noRepeat,
            width: 170.0,
          ),
          *//*

*/
/* Divider(
            height: 105.2,
            color: Colors.white,
          ),*//*
*/
/*

        ]),
      ),
    );
  }
}



*//*

*/
/*

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return  MaterialApp(
      initialRoute: '/',
      routes: {

   '/': (context) => SignupWithValidation(),
       // '/': (context) => LoginValidation(),
   // SignupWithValidation

    //'/': (context) => SignupWithValidation(),

    //"/home": (context) => HomeRoute(),
      },

    );
  }
}*//*
*/
/*

*/
