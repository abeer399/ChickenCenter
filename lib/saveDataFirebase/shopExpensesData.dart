
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usamaokharvichicken/Utils.dart';
import 'package:usamaokharvichicken/pages/homePage.dart';

class ShopData extends StatefulWidget {
  final Firebase app;
  ShopData({this.app});
  @override
  _ShopDataState createState() => _ShopDataState();
}

class _ShopDataState extends State<ShopData> {
final referenceDatabase = FirebaseDatabase.instance;
DatabaseReference _shopRef;
  
  @override
  void initState(){
  super.initState();
  final FirebaseDatabase database = FirebaseDatabase();
  _shopRef = database.reference().child("ShopExpense");
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
          onTap: ()=>navigate(context, HomePage()),
          child: Icon(
            Icons.navigate_before,
            size: 30,
          ),
        ),
        title: Text(
          "Shop Expenses Data",
          style: GoogleFonts.aclonica(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: FirebaseAnimatedList(
        query: _shopRef,
    itemBuilder:(BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 110),
                child: Text("Shop Expenses",style: GoogleFonts.aclonica(
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
                child: Text("Purchase Chicken Amount",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["purchase"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Sale Chicken Amount",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["sale"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Shop Tea",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["tea"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Shop Food",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["food"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Shop Committee",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["committee"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Shop Credit Amount",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["creadit"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Shop Debit Amount",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["debit"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Worker Wages",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["worker"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Other Expenses",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["other"].toString()),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10,start: 15),
                child: Text("Total Shop Expense",style: GoogleFonts.aclonica(
                    color: Colors.grey[800],
                    fontSize: 14
                ),),
              ),
              ListTile(
                title: Text(snapshot.value["totalshop"].toString()),
              ),
            ],
          );
    }
    ),
      );

  }
}

