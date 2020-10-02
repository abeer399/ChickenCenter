
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:usamaokharvichicken/Utils.dart';
import 'package:usamaokharvichicken/pages/homePage.dart';
class CarExpenses extends StatefulWidget {
  @override
  _CarExpensesState createState() => _CarExpensesState();
}

class _CarExpensesState extends State<CarExpenses> {
  saveData() {
    final DatabaseReference database = FirebaseDatabase.instance.reference().child("VehicalsExpense");
    String carinstallment = carinstallCtrl.text;
    String carmaintence = carmaintenceCtrl.text;
    String bikeinstallment = bikeinstallCtrl.text;
    String bikemaintence = bikemaintenceCtrl.text;
    String total = totalAmountCtrl.text;
    String date = dateCtrl.text;
    String id = database.push().key;

    database.child(id).set({
      "id" : id,
      "carinstallment" :carinstallment,
      "carmaintence" : carmaintence,
      "bikeinstallment" : bikeinstallment,
      "bikemaintance" : bikemaintence,
      "total" : total,
      "date" : date

    });
  }
  DateTime _dateTime = new DateTime.now();

  TextEditingController dateCtrl = TextEditingController();
  TextEditingController carinstallCtrl = TextEditingController();
  TextEditingController carmaintenceCtrl = TextEditingController();
  TextEditingController bikeinstallCtrl = TextEditingController();
  TextEditingController bikemaintenceCtrl = TextEditingController();
  TextEditingController totalAmountCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String formatDate = new DateFormat.yMMMEd().format(_dateTime);
    Future<Null>_selectDate(BuildContext context)async {
      final DateTime _selDate = await showDatePicker(
          context: context,
          initialDate: _dateTime,
          firstDate: DateTime(2020),
          lastDate: DateTime(2050));
      if (_selDate != null) {
        _dateTime = _selDate;
      }
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: GestureDetector(
          onTap: ()=>navigate(context, HomePage()),
          child: Icon(Icons.navigate_before,size: 30,),
        ),
        title: Text("Vehicles Expenses",style: GoogleFonts.aclonica(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(top: 30,start: 20),
                child: Text("Vehicles Expenses",style: GoogleFonts.aclonica(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsetsDirectional.only(start: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Today Date: $formatDate',style: GoogleFonts.aclonica(
                        fontSize: 16
                    ),),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                padding: EdgeInsetsDirectional.only(start: 110),
                child: Text("Car Expenses",style: GoogleFonts.aclonica(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsetsDirectional.only(start: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: getScreenSize(context).width-20,
                    height: 60,
                    child: Card(
                      elevation: 20,
                      child: CupertinoTextField(
                        controller: dateCtrl,
                        autocorrect: true,
                        keyboardType: TextInputType.number,
                        placeholder: "Enter Today Date",
                        enableSuggestions: true,
                        style: TextStyle(
                            color: Colors.black
                        ),
                        placeholderStyle: TextStyle(
                          color: Colors.black,
                        ),
                        padding: EdgeInsetsDirectional.only(start: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsetsDirectional.only(start: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: getScreenSize(context).width-20,
                    height: 60,
                    child: Card(
                      elevation: 20,
                      child: CupertinoTextField(
                        controller: carinstallCtrl,
                        autocorrect: true,
                        keyboardType: TextInputType.number,
                        placeholder: "Enter Your Car Installment",
                        enableSuggestions: true,
                        style: TextStyle(
                            color: Colors.black
                        ),
                        placeholderStyle: TextStyle(
                          color: Colors.black,
                        ),
                        padding: EdgeInsetsDirectional.only(start: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsetsDirectional.only(start: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: getScreenSize(context).width-20,
                    height: 60,
                    child: Card(
                      elevation: 20,
                      child: CupertinoTextField(
                        controller: carmaintenceCtrl,
                        autocorrect: true,
                        keyboardType: TextInputType.number,
                        placeholder: "Enter Your Car Maintenance",
                        enableSuggestions: true,
                        style: TextStyle(
                            color: Colors.black
                        ),
                        placeholderStyle: TextStyle(
                          color: Colors.black,
                        ),
                        padding: EdgeInsetsDirectional.only(start: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                padding: EdgeInsetsDirectional.only(start: 110),
                child: Text("Bike Expenses",style: GoogleFonts.aclonica(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsetsDirectional.only(start: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: getScreenSize(context).width-20,
                    height: 60,
                    child: Card(
                      elevation: 20,
                      child: CupertinoTextField(
                        controller: bikeinstallCtrl,
                        autocorrect: true,
                        keyboardType: TextInputType.number,
                        placeholder: "Enter Your Car Installment",
                        enableSuggestions: true,
                        style: TextStyle(
                            color: Colors.black
                        ),
                        placeholderStyle: TextStyle(
                          color: Colors.black,
                        ),
                        padding: EdgeInsetsDirectional.only(start: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsetsDirectional.only(start: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: getScreenSize(context).width-20,
                    height: 60,
                    child: Card(
                      elevation: 20,
                      child: CupertinoTextField(
                        controller: bikemaintenceCtrl,
                        autocorrect: true,
                        keyboardType: TextInputType.number,
                        placeholder: "Enter Your Bike Maintenance",
                        enableSuggestions: true,
                        style: TextStyle(
                            color: Colors.black
                        ),
                        placeholderStyle: TextStyle(
                          color: Colors.black,
                        ),
                        padding: EdgeInsetsDirectional.only(start: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),

          Center(
            child: Container(

              padding: EdgeInsetsDirectional.only(start: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: getScreenSize(context).width-50,
                  height: 60,
                  child: Card(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: totalAmountCtrl,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none
                      ),
                      style: TextStyle(
                          fontSize: 22,
                          // fontWeight: FontWeight.w600,
                          color: Colors.black),
                      onTap: (){
                        int a = int.parse(carinstallCtrl.text);
                        int b = int.parse(carmaintenceCtrl.text);
                        int c = int.parse(bikeinstallCtrl.text);
                        int d = int.parse(bikemaintenceCtrl.text);
                        int f = (a+b+c+d);
                        totalAmountCtrl.text = f.toString();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                saveData();
                carinstallCtrl.clear();
                carmaintenceCtrl.clear();
                bikemaintenceCtrl.clear();
                bikeinstallCtrl.clear();
                totalAmountCtrl.clear();
                dateCtrl.clear();
              },
              child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                        height: 45,
                        color: Color(0xFFDB3022),
                        width: getScreenSize(context).width - 40,
                        child: Container(
                          padding: EdgeInsetsDirectional.only(top: 12),
                          child: Text(
                            "SAVE",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                  ))),
          SizedBox(
            height: 50,
          ),


        ],
      ),
    );
  }
}
