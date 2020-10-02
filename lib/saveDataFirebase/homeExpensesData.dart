
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usamaokharvichicken/Utils.dart';
import 'package:usamaokharvichicken/pages/homePage.dart';

class HomeData extends StatefulWidget {
  HomeData({this.app});
  final Firebase app;
  @override
  _HomeDataState createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  final referenceDatabase = FirebaseDatabase.instance;
  DatabaseReference _homeRef;
  @override
  void initState() {
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase();
    _homeRef = database.reference().child("HomeExpense");

  }



  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
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
            "Home Expenses Data",
            style: GoogleFonts.aclonica(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      body: FirebaseAnimatedList(
        query: _homeRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 125),
                child: Text("Home Expense",style: GoogleFonts.aclonica(
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
                child: Text("Electric Bill",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["electric"]),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Gas Bill",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["gas"]),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Maintenance",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["maintenance"]),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Remittance",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["remittance"]),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Water Bill",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["water"]),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Other Expenses",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["other"]),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Total of Expenses",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["total"]),
              )
            ],
          );
        } ),


    );
  }
}
