
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usamaokharvichicken/Utils.dart';
import 'package:usamaokharvichicken/pages/homePage.dart';



class VehicalsData extends StatefulWidget {
  final Firebase app;
  VehicalsData({this.app});
  @override
  _VehicalsDataState createState() => _VehicalsDataState();
}

class _VehicalsDataState extends State<VehicalsData> {
  final referneceDatabas = FirebaseDatabase.instance;
  DatabaseReference _vehicalsRef;
  @override
  void initState(){
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase();
    _vehicalsRef = database.reference().child("VehicalsExpense");
  }


  @override
  Widget build(BuildContext context) {
    final ref = referneceDatabas.reference();
    return  Scaffold(
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
            "Vehicals Expenses Data",
            style: GoogleFonts.aclonica(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      body: FirebaseAnimatedList(
        query: _vehicalsRef,
        itemBuilder:(BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 110),
                child: Text("Vehical Expenses",style: GoogleFonts.aclonica(
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
                title: Text(snapshot.value["date"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Car Installment",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["carinstallment"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Car Maintenance",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["carmaintence"]),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Bike Installment",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["bikeinstallment"]),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Bike Maintenance",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["bikemaintance"]),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Total Amount",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["total"]),
              ),
            ],
          );
        } ,
      ),
    );
  }
}

