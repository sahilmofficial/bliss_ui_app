import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  FormScreenState createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  TextEditingController _nameController, _numberOfDosesController;
  // String _typeSelected = '';

  DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _numberOfDosesController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Medicines');
  }
  // String _email;
  // String _password;
  // String _url;
  // String _phoneNumber;
  // String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(labelText: 'Medicine Name'),
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Medicine name is required';
        }

        return null;
      },
      // onSaved: (String value) {
      //   _name = value;
      // },
    );
  }

  Widget _buildDoses() {
    return TextFormField(
      controller: _numberOfDosesController,
      decoration: InputDecoration(labelText: 'Number of Doses per day'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Number of doses must be greater than 0';
        }

        return null;
      },
      // onSaved: (String value) {
      //   _doses = value;
      // },
    );
  }

  // Widget _buildEmail() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Email'),
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Email is Required';
  //       }

  //       if (!RegExp(
  //               r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
  //           .hasMatch(value)) {
  //         return 'Please enter a valid email Address';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _email = value;
  //     },
  //   );
  // }

  // Widget _buildPassword() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Password'),
  //     keyboardType: TextInputType.visiblePassword,
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Password is Required';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _password = value;
  //     },
  //   );
  // }

  // Widget _builURL() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Url'),
  //     keyboardType: TextInputType.url,
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'URL is Required';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _url = value;
  //     },
  //   );
  // }

  // Widget _buildPhoneNumber() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Phone number'),
  //     keyboardType: TextInputType.phone,
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Phone number is Required';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _url = value;
  //     },
  //   );
  // }

  // Widget _buildCalories() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Calories'),
  //     keyboardType: TextInputType.number,
  //     validator: (String value) {
  //       int calories = int.tryParse(value);

  //       if (calories == null || calories <= 0) {
  //         return 'Calories must be greater than 0';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _calories = value;
  //     },
  //   );
  // }

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
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildDoses(),
              // _buildEmail(),
              // _buildPassword(),
              // _builURL(),
              // _buildPhoneNumber(),
              // _buildCalories(),
              SizedBox(height: 60),
              RaisedButton(
                child: Text(
                  'Add Remainder',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();
                  saveRemainder();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveRemainder() {
    String name = _nameController.text;
    String number = _numberOfDosesController.text;

    Map<String, String> contact = {
      'medicinename': name,
      'numberofdoses': number,
    };

    _ref.push().set(contact).then((value) {
      Navigator.pop(context);
    });
  }
}
