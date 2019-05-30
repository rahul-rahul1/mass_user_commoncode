import 'package:flutter/material.dart';
import 'package:mass_user_commoncode/Widget/customtextfield.dart';
import 'package:mass_user_commoncode/landing.dart';
import 'package:mass_user_commoncode/model/user_model.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _signupScreen();
  }
}

class _signupScreen extends State<Signup> {
  bool _validate = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var _email = TextEditingController();
  var _user = TextEditingController();
  var _pass = TextEditingController();
  var _cpass = TextEditingController();
  String selectedValue;
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  String signupText = "SignUp";
  String locationName = 'Location';
  bool index = true;
  bool isLoading = false;
  bool hiddenText = true;

  UserModel user = UserModel(
      id: "",
      name: "",
      blood: "",
      contact: "",
      longitude: 0,
      latitude: 0,
      email: "");
  static const blood = <String>['A+', 'A-', 'B+', 'B-', 'O+', 'O-'];
  final List<DropdownMenuItem<String>> _bloodgroups = blood
      .map(
        (String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value,
          style: TextStyle(
            color: Colors.red,
          )),
    ),
  )
      .toList();
  void _signup() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
    } else
      return;
    if (_pass.text != _cpass.text) {
      showSnackbar('Password do not match');
    } else {
      try {
        setState(() {
          isLoading = true;
        });
       /* var fUser = await FirebaseAuthProvider()
            .signup(_email.text, _pass.text, _user.text);
        FirestoreProvider().addUser(user..id = fUser.uid);
*/
        setState(() {
          _email.text = "";
          _pass.text = "";

          index = true;
          isLoading = false;
        });
        showSnackbar('Sucessfully signed up login now');
    /*    Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));*/
      } catch (err) {
        setState(() {
          isLoading = false;
        });
        showSnackbar(err.message);
      }
    }
  }

  showSnackbar(message) {
    _scaffoldkey.currentState.showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).primaryColor,
      content: Text(message ?? "Something went wrong, try again later."),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("LoginValidation"),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Form(
           // key: _formkey,
           // autovalidate: _validate,
            child: buildSignupForm(),
          ),
        ),
      ),
    );
  }

  buildSignupForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          CustomTextField(

            textCapitalization: TextCapitalization.words,
            controller: _user,
            onSaved: (value) {
               user.name = value;
            },

            label: "Fullname",
            hint: "Ex: Marquees Brownlee",
            onValidate: (value) {
              if (value.isEmpty) return 'This field can\'t be empty';
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: _email,

            onSaved: (value) {
                 user.email = value;
            },
            hint: "Email",
            onValidate: (value) {
              if (value.isEmpty) return 'This field can\'t be empty';
            },
            inputType: TextInputType.emailAddress,
            label: "Email",
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: _pass,
            label: "Password",
            hint: "Password",
            onValidate: (value) {
              if (value.isEmpty) return 'This field can\'t be empty';
            },
            obscure: hiddenText,
            suffixIcon: IconButton(
              icon: Icon(
                  hiddenText ? Icons.panorama_fish_eye : Icons.remove_red_eye,
                  color: Colors.black),
              onPressed: () {
                setState(() {
                  hiddenText = !hiddenText;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: _cpass,
            onValidate: (value) {
              if (value.isEmpty) return 'This field can\'t be empty';
            },
            label: "Confirm Password",
            hint: "Re-Enter Password",
            obscure: hiddenText,
            suffixIcon: IconButton(
              icon: Icon(
                hiddenText ? Icons.panorama_fish_eye : Icons.remove_red_eye,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  hiddenText = !hiddenText;
                });
              },
            ),
          ),

          //
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              user.contact = value;
            },
            onValidate: (value) {
              if (value.length != 10)
                return 'Phone Number must be of 10 digits';
              else if (value.isEmpty) return 'This field can\'t be empty';
            },
            label: 'Contact',
            hint: 'Ex:9880124587',
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 1))),
            child: DropdownButtonFormField(
              value: selectedValue,
              hint: Text(
                'Blood Group',
                style: TextStyle(color: Colors.white),
              ),
               items: _bloodgroups,
              onChanged: ((String newvalue) {
                setState(() {
                  selectedValue = newvalue;
                  print(selectedValue);
                   user.blood = selectedValue;
                });
              }),
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 1))),
            height: 55,
            child: FlatButton(
              child: Text(locationName,
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onPressed: () async {
              var loc = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LandingScreen()));
              if (loc != null) {
                setState(() {
                  locationName = "${loc.latitude},${loc.longitude}";
                });
                user.latitude = loc.latitude;
                user.longitude = loc.longitude;
              }
            },
            ),
          ),
          SizedBox(
            height: 20,
          ),

          new RaisedButton(
            child: const Text('Connect with Map'),
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              print('@@@@ValidatioSignup');

              _signup();
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>MapActivity()));
            },
          )
          /*   Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 90,
              child: ClipPolygon(
                sides: 6,
                rotate: 120,
                borderRadius: 9.0,
                child: Container(
                  color: Colors.red,
                  child: isLoading
                      ? Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.yellow)))
                      : IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                //    onPressed: _signup,
                  ),
                ),
              ),
            ),
          ],
        ),*/
        ],
      ),
    );
  }
}
