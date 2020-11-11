import 'package:flutter/material.dart';
import "main.dart";
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import "medicine_remainder.dart";

class MainDrawer extends StatelessWidget {
  // const MainDrawer({Key key}) : super(key: key);
  final facebookLogin = FacebookLogin();

  _logoutFB() {
    facebookLogin.logOut();
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        _logoutFB();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout Alert"),
      content: Text("Would you like to logout?"),
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

  @override
  Widget build(BuildContext context) {
    String username = MyHomePage.newestBinary["name"];
    var userurl = MyHomePage.newestBinary["picture"]["data"]["url"];
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                  userurl,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                username,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              // SizedBox(
              //   height: 5.0,
              // ),
              // Text(
              //   "Software Engenieer",
              //   style: TextStyle(
              //     fontSize: 16.0,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("Your Profile"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.assessment,
          color: Colors.black,
        ),
        title: Text("Track Previous Symptoms"),
      ),

      ListTile(
        onTap: () {
          // FormScreen();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MedicineRemainderPage()));
        },
        leading: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text("Your Medicine Remainders"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.timer,
          color: Colors.black,
        ),
        title: Text("Track Periods"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: Text("Settings"),
      ),
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.security,
          color: Colors.black,
        ),
        title: Text("Privacy Policy"),
      ),
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.star_border,
          color: Colors.black,
        ),
        title: Text("Rate Bliss"),
      ),
      ListTile(
        onTap: () {
          showAlertDialog(context);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => MyHomePage()));
        },
        leading: Icon(
          Icons.exit_to_app,
          color: Colors.black,
        ),
        title: Text("Logout"),
      ),
    ]);
  }
}
