import 'package:flutter/material.dart';

import './page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentProfilePic =
      "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";
  String otherProfilePic =
      "https://yt3.ggpht.com/-2_2skU9e2Cw/AAAAAAAAAAI/AAAAAAAAAAA/6NpH9G8NWf4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg";

  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
    String _selectLocation; // Option 2
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("bliss"),
          backgroundColor: Colors.blue,
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountEmail: new Text("bramvbilsen@gmail.com"),
                accountName: new Text("Bramvbilsen"),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(currentProfilePic),
                  ),
                  onTap: () => print("This is your current account."),
                ),
                otherAccountsPictures: <Widget>[
                  new GestureDetector(
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(otherProfilePic),
                    ),
                    onTap: () => switchAccounts(),
                  ),
                ],
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage(
                            "https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg"),
                        fit: BoxFit.fill)),
              ),
              new ListTile(
                title: new Text("Profile"),
                trailing: new Icon(Icons.arrow_right),
                // onTap: () {
                //   Navigator.of(context).pop();
                //   Navigator.of(context).push(new MaterialPageRoute(
                //       builder: (BuildContext context) =>
                //           new Page("First Page")));
                // }
              ),
              new ListTile(
                title: new Text("Settings"),
                trailing: new Icon(Icons.arrow_right),
                // onTap: () {
                //   Navigator.of(context).pop();
                //   Navigator.of(context).push(new MaterialPageRoute(
                //       builder: (BuildContext context) =>
                //           new Page("Second Page")));
                // }
              ),
              new ListTile(
                title: new Text("About us"),
                trailing: new Icon(Icons.arrow_right),
                // onTap: () {
                //   Navigator.of(context).pop();
                //   Navigator.of(context).push(new MaterialPageRoute(
                //       builder: (BuildContext context) =>
                //           new Page("First Page")));
                // }
              ),
              // new Divider(),
              new ListTile(
                title: new Text("Back"),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        body: new Center(
            child: DropdownButton(
          hint: Text('Please choose a symptom'), // Not necessary for Option 1
          value: _selectLocation,
          onChanged: (newValue) {
            setState(() {
              _selectLocation = newValue;
            });
          },
          items: _locations.map((location) {
            return DropdownMenuItem(
              child: new Text(location),
              value: location,
            );
          }).toList(),
        )));
  }
}
