

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usamaokharvichicken/Utils.dart';
import 'package:usamaokharvichicken/pages/homePage.dart';

class PersonalData extends StatefulWidget {
  final Firebase app;
  PersonalData({this.app});
  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final referanceDatabase = FirebaseDatabase.instance;
  DatabaseReference _personalRef;
  @override
  void initState() {
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase();
    _personalRef = database.reference().child("PersonalExpense");
  }

  @override
  Widget build(BuildContext context) {
    final ref = referanceDatabase.reference();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => navigate(context, HomePage()),
            child: Icon(
              Icons.navigate_before,
              size: 30,
            ),
          ),
          title: Text(
            "Personal Expenses Data",
            style: GoogleFonts.aclonica(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      body: FirebaseAnimatedList(
        query: _personalRef,
        itemBuilder:(BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 110),
                child: Text("Personal Expenses",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 22
                ),),
              ),

              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Date",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["date"]),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Own Expenses",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["own"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Family Medical Expenses",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["medical"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Ramsha Expenses",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["ramsha"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Total of Personal Expenses",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["totalexpence"].toString()),
              ),
            ],
          );
        } ,
      ),
    );
  }
}
