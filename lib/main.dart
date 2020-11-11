import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'signup.dart';
import 'questions.dart';
import 'homepage.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

void main() {
  // For remainder
  // WidgetsFlutterBinding.ensureInitialized();

  // var initializationSettingsAndroid =
  //     AndroidInitializationSettings('codex_logo');
  // var initializationSettingsIOS = IOSInitializationSettings(
  //     requestAlertPermission: true,
  //     requestBadgePermission: true,
  //     requestSoundPermission: true,
  //     onDidReceiveLocalNotification:
  //         (int id, String title, String body, String payload) async {});
  // var initializationSettings = InitializationSettings(
  //     initializationSettingsAndroid, initializationSettingsIOS);
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //     onSelectNotification: (String payload) async {
  //   if (payload != null) {
  //     debugPrint('notification payload: ' + payload);
  //   }
  // });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/questions': (BuildContext context) => new QuestionPage(),
        '/homepage': (BuildContext context) => new HomePage()
      },
      home: new MyHomePage(),
    );
  }
}

// class ServerStatus {
//   static Map newestBinary;
// }

class MyHomePage extends StatefulWidget {
  static Map newestBinary;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoggedInFB = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();
  _loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedInFB = true;
          MyHomePage.newestBinary = userProfile;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedInFB = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedInFB = false);
        break;
    }
  }

  _logoutFB() {
    facebookLogin.logOut();
    setState(() {
      _isLoggedInFB = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedInFB) {
      return Scaffold(
        body: Stack(
          children: [HomePage()],
        ),
      );
    } else {
      return new Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
              child: Container(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    // Container(
                    //   padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    //   child: Text('Hello',
                    //       style: TextStyle(
                    //           fontSize: 80.0, fontWeight: FontWeight.bold)),
                    // ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                      child: Text('bliss',
                          style: TextStyle(
                              fontSize: 70.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(170.0, 168.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: ImageIcon(
                                    AssetImage('assets/facebook.png')),
                              ),
                              SizedBox(width: 10.0),
                              Center(
                                child: OutlineButton(
                                  child: Text('Continue with facebook',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                  onPressed: () {
                                    _loginWithFB();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New to bliss ?',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ))));
    }
  }
}
