
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:usamaokharvichicken/Utils.dart';
import 'package:usamaokharvichicken/pages/homePage.dart';




class HomeExpence extends StatefulWidget {
  @override
  _HomeExpenceState createState() => _HomeExpenceState();
}

class _HomeExpenceState extends State<HomeExpence> {
  saveData() {
    final DatabaseReference database = FirebaseDatabase.instance.reference().child("HomeExpense");
    String remittance = remittanceCtrl.text;
    String electric = electricCtrl.text;
    String gas = gasCtrl.text;
    String water = waterCtrl.text;
    String maintenance = maintenanceCtrl.text;
    String other = otherCtrl.text;
    String total = totalHomeCtrl.text;
    String date = dateCtrl.text;
    String id = database.push().key;
    database.child(id).set({
      "id" : id,
      "remittance" : remittance,
      "electric" : electric,
      'gas' : gas,
      'water': water,
      'maintenance' : maintenance,
      "other" : other,
      "total" : total,
      "date" : date

    });
  }

  DateTime _dateTime = new DateTime.now();

  TextEditingController totalHomeCtrl =TextEditingController();
  TextEditingController remittanceCtrl = TextEditingController();
  TextEditingController electricCtrl = TextEditingController();
  TextEditingController gasCtrl = TextEditingController();
  TextEditingController waterCtrl = TextEditingController();
  TextEditingController maintenanceCtrl = TextEditingController();
  TextEditingController otherCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String formatDate = new DateFormat.yMMMEd().format(_dateTime);
    Future<Null> _selectDate(BuildContext context) async {
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
        onTap: () => navigate(context, HomePage()),
        child: Icon(
          Icons.navigate_before,
          size: 30,
        ),
      ),
      title: Text(
        "Home Expenses",
        style: GoogleFonts.aclonica(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
      body: ListView(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.only(top: 30, start: 20),
                  child: Text(
                    "Home Expenses",
                    style: GoogleFonts.aclonica(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                      Text(
                        'Today Date: $formatDate',
                        style: GoogleFonts.aclonica(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: getScreenSize(context).width - 20,
                      height: 60,
                      child: Card(
                        child: CupertinoTextField(
                          controller: dateCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Today Date",
                          enableSuggestions: true,
                          style: TextStyle(color: Colors.black),
                          placeholderStyle: TextStyle(
                            color: Colors.black,
                          ),
                          padding: EdgeInsetsDirectional.only(start: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: getScreenSize(context).width - 20,
                      height: 60,
                      child: Card(
                        child: CupertinoTextField(
                          controller: remittanceCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Your Home Remittance",
                          enableSuggestions: true,
                          style: TextStyle(color: Colors.black),
                          placeholderStyle: TextStyle(
                            color: Colors.black,
                          ),
                          padding: EdgeInsetsDirectional.only(start: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: getScreenSize(context).width - 20,
                      height: 60,
                      child: Card(
                        child: CupertinoTextField(
                          controller: electricCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Your Electric Bill",
                          enableSuggestions: true,
                          style: TextStyle(color: Colors.black),
                          placeholderStyle: TextStyle(
                            color: Colors.black,
                          ),
                          padding: EdgeInsetsDirectional.only(start: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: getScreenSize(context).width - 20,
                      height: 60,
                      child: Card(
                        child: CupertinoTextField(
                          controller: gasCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Your Gas Bill",
                          enableSuggestions: true,
                          style: TextStyle(color: Colors.black),
                          placeholderStyle: TextStyle(
                            color: Colors.black,
                          ),
                          padding: EdgeInsetsDirectional.only(start: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: getScreenSize(context).width - 20,
                      height: 60,
                      child: Card(
                        child: CupertinoTextField(
                          controller: maintenanceCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Your Home Maintenance",
                          enableSuggestions: true,
                          style: TextStyle(color: Colors.black),
                          placeholderStyle: TextStyle(
                            color: Colors.black,
                          ),
                          padding: EdgeInsetsDirectional.only(start: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: getScreenSize(context).width - 20,
                      height: 60,
                      child: Card(
                        child: CupertinoTextField(
                          controller: waterCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Your Water Bill",
                          enableSuggestions: true,
                          style: TextStyle(color: Colors.black),
                          placeholderStyle: TextStyle(
                            color: Colors.black,
                          ),
                          padding: EdgeInsetsDirectional.only(start: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: getScreenSize(context).width - 20,
                      height: 60,
                      child: Card(
                        child: CupertinoTextField(
                          controller: otherCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Your Other Expenses",
                          enableSuggestions: true,
                          style: TextStyle(color: Colors.black),
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
          ),
          SizedBox(
            height: 20,
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
                      controller: totalHomeCtrl,
                      readOnly: true,
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                      style: TextStyle(
                          fontSize: 22,
                          // fontWeight: FontWeight.w600,
                          color: Colors.black),
                      onTap: (){
                        int a = int.parse(waterCtrl.text);
                        int b = int.parse(otherCtrl.text);
                        int c = int.parse(maintenanceCtrl.text);
                        int d = int.parse(gasCtrl.text);
                        int f = int.parse(electricCtrl.text);
                        int g = int.parse(remittanceCtrl.text);
                        int e = (a+b+c+d+f+g);
                        totalHomeCtrl.text = e.toString();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),

          GestureDetector(
              onTap: () {
                saveData();
                remittanceCtrl.clear();
                gasCtrl.clear();
                electricCtrl.clear();
                waterCtrl.clear();
                maintenanceCtrl.clear();
                otherCtrl.clear();
                totalHomeCtrl.clear();
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
          )
        ],
      ),
    );
  }
}
