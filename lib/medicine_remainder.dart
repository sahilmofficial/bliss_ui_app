import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'set_medicine_remainder.dart';

class MedicineRemainderPage extends StatefulWidget {
  @override
  _MedicineRemainderPageState createState() => _MedicineRemainderPageState();
}

class _MedicineRemainderPageState extends State<MedicineRemainderPage> {
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Medicines')
        .orderByChild('medicinename');
  }

  Widget _buildMedicinesItem({Map medicines}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.pie_chart_outlined,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                medicines['medicinename'],
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.confirmation_number,
                color: Theme.of(context).accentColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                medicines['numberofdoses'],
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600),
              ),
              // SizedBox(width: 15),
              // Icon(
              //   Icons.group_work,
              //   size: 20,
              // ),
              // SizedBox(
              //   width: 6,
              // ),
              // Text(
              //   medicines['type'],
              //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              // ),
            ],
          ),
        ],
      ),
    );
  }

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
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map medicines = snapshot.value;
            return _buildMedicinesItem(medicines: medicines);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return FormScreen();
            }),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
