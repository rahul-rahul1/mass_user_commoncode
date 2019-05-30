import 'package:flutter/material.dart';
import 'package:mass_user_commoncode/signup.dart';

class LandingScreen extends StatefulWidget {

  final String text;

  // receive data from the FirstScreen as a parameter
  LandingScreen({Key key, @required this.text}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _landingScreen();
  }
}
  class _landingScreen extends State<LandingScreen>{
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
          appBar: new AppBar(
            centerTitle: true,
            title: new Text("Landing Screen"),

          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: onNeed,
                      child: new Text("Need"),
                    ),
                    new RaisedButton(
                      onPressed: onDonate,
                      textColor: Colors.white,
                      color: Colors.red,
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        "Donate",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
    }

  void onNeed() {
      print('@@Method Click OnNeed');

  }

  void onDonate() {
    print('@@Method Click onDonate');
    showErrorDialog();


  }

    showErrorDialog() {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: Text('You must Login to continue !',
                    style: TextStyle(color: Colors.red)),
                actions: <Widget>[
                  FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        print('@@ShowDialog');
                        Navigator.pop(context);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      }),
                ],
                title: Text(
                  'Oops',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ));
          });
    }
}

