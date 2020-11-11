import 'package:flutter/material.dart';
import 'drawer.dart';
import "main.dart";
import "questions.dart";
import 'dart:io';
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var username = MyHomePage.newestBinary["name"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        exit(0);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Exit Alert"),
      content: Text("Exit bliss now?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // String countryId;
  // List<String> country = [
  //   "Fever",
  //   "Cough",
  //   "Chills",
  //   "Itching",
  //   "Neck Pain",
  //   "Aches"
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "bliss",
          style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              //fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
            SizedBox(height: 80.0),
            Align(
              alignment: Alignment.topRight,
              child: Image(
                  image: AssetImage('assets/blissdoctor.png'), height: 120),
            ),
            SizedBox(height: 15.0),
            // Container(
            //     padding: EdgeInsets.only(top: 335.0, left: 120.0, right: 20.0),
            Column(
              children: <Widget>[
                SizedBox(height: 5.0),
                Container(
                  child: Center(
                      child: Text(
                    'Hi $username, tell us what are you looking for?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  )),
                ),
                SizedBox(height: 25.0),
                Container(
                  padding: EdgeInsets.only(left: 80.0, right: 20.0),
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    //shadowColor: Colors.greenAccent,
                    color: Colors.indigoAccent[100],
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Find nearest medical center',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.only(left: 150.0, right: 20.0),
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    //shadowColor: Colors.greenAccent,
                    color: Colors.indigoAccent[100],
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuestionPage()));
                      },
                      child: Center(
                        child: Text(
                          'Start assesment',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.only(left: 170.0, right: 20.0),
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    //shadowColor: Colors.greenAccent,
                    color: Colors.indigoAccent[100],
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Track your periods',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.only(left: 120.0, right: 20.0),
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    //shadowColor: Colors.greenAccent,
                    color: Colors.indigoAccent[100],
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Find nearby doctors',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.only(left: 250.0, right: 20.0),
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    //shadowColor: Colors.greenAccent,
                    color: Colors.indigoAccent[100],
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Center(
                        child: Text(
                          'Exit Bliss',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]))),
      // body: Container(
      //   padding: EdgeInsets.all(15.0),
      //   child: Center(
      //       child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: <Widget>[
      //         Text("What Symptom do you have?"),
      //         DropDownField(
      //           onValueChanged: (dynamic value) {
      //             countryId = value;
      //           },
      //           value: countryId,
      //           required: false,
      //           hintText: 'Choose a symptom',
      //           labelText: 'Symptoms',
      //           items: country,
      //         ),
      //       ])),
      // ),
      //Now we are going to open a new file
      // where we will create the layout of the Drawer
      drawer: Drawer(
        child: MainDrawer(),
      ),
    );
  }
}
