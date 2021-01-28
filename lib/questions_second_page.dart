import 'package:flutter/material.dart';
import 'drawer.dart';
import 'main.dart';
import 'dart:io';
import 'homepage.dart';
import 'dart:core';
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

class QuestionSecondPage extends StatefulWidget {
  List question;
  String keyword;
  int flag;
  int list_length;
  QuestionSecondPage(
      {this.question, this.keyword, this.flag, this.list_length});
  @override
  _QuestionSecondPageState createState() =>
      new _QuestionSecondPageState(question, keyword, flag, list_length);
}

class _QuestionSecondPageState extends State<QuestionSecondPage> {
  List question;
  String keyword;
  int flag;
  int list_length;
  _QuestionSecondPageState(
      this.question, this.keyword, this.flag, this.list_length);
  var username = MyHomePage.newestBinary["name"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // getQuestion() async {
  //   final response = await http.get('http://127.0.0.1:5000/test');
  //   final decoded = json.decode(response.body) as Map<String, dynamic>;
  //   setState(() {
  //     question = decoded['question'];
  //   });
  // }

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

  // getQuestion() async {
  //   final response =
  //       await http.get('https://blisstestapp.herokuapp.com/gettest');
  //   print("response: " + response.body);
  //   final decoded = json.decode(response.body) as Map<String, dynamic>;
  //   print(decoded['questions']);
  //   setState(() {
  //     question = decoded['questions'];
  //   });
  // }

  Widget _getQuestion() {
    return Container(
      child: Center(
          child: Text(
        question[flag],
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            //fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat'),
      )),
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
    // getQuestion() async {
    //   final response =
    //       await http.get('https://blisstestapp.herokuapp.com/getquestions');
    //   print("response: " + response.body);
    //   final decoded = json.decode(response.body) as Map<String, dynamic>;
    //   print(decoded['name']);
    //   setState(() {
    //     question = decoded['name'];
    //   });
    // }

    // getQuestion(); // Calling the question function to get the Qustion to be asked
    print("value of question is : " + question[flag]);
    print(list_length);
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
            SizedBox(height: 45.0),
            // Container(
            //     padding: EdgeInsets.only(top: 335.0, left: 120.0, right: 20.0),
            Column(
              children: <Widget>[
                SizedBox(height: 5.0),
                _getQuestion(),
                SizedBox(height: 25.0),
                Container(
                  padding: EdgeInsets.only(left: 170.0, right: 20.0),
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    //shadowColor: Colors.greenAccent,
                    color: Colors.indigoAccent[100],
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        // final response = await http.get(
                        //     'https://blisstestapp.herokuapp.com/getquestions/' +
                        //         keyword +
                        //         '/1');
                        // final decoded =
                        //     json.decode(response.body) as Map<String, dynamic>;
                        // question = decoded['questions'];
                        // keyword = decoded['keyword'];
                        flag = flag + 1;
                        if (flag == list_length) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestionSecondPage(
                                        question: question,
                                        keyword: keyword,
                                        flag: flag,
                                        list_length: list_length,
                                      )));
                        }
                      },
                      child: Center(
                        child: Text(
                          'Yes',
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
                          'No',
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Center(
                        child: Text(
                          'Back to home',
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
      drawer: Drawer(
        child: MainDrawer(),
      ),
    );
  }
}
