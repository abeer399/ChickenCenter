
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:usamaokharvichicken/Utils.dart';
import 'package:usamaokharvichicken/pages/homePage.dart';


class ShopExpenses extends StatefulWidget {
  @override
  _ShopExpensesState createState() => _ShopExpensesState();
}

class _ShopExpensesState extends State<ShopExpenses> {

  DateTime _dateTime = new DateTime.now();

  saveData() {
    final DatabaseReference database = FirebaseDatabase.instance.reference().child("PersonalExpense");
    String own = ownCtrl.text;
    String medical = medicalCtrl.text;
    String ramsha = ramshaCtrl.text;
    String totalexpence = totalExpence.text;
    String date = datCtrl.text;
    String id = database.push().key;
    database.child(id).set({
      "id" : id,
      "date": date,
      "own": own,
      "medical" : medical,
      "ramsha" : ramsha,
      "totalexpence" : totalexpence
    });
  }
  TextEditingController datCtrl = TextEditingController();
  TextEditingController ownCtrl = TextEditingController();
  TextEditingController medicalCtrl = TextEditingController();
  TextEditingController ramshaCtrl = TextEditingController();
  TextEditingController totalExpence = TextEditingController();
 // DateTime _dateTime;


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
        title: Text("Personal Expenses",style: GoogleFonts.aclonica(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                      padding: EdgeInsetsDirectional.only(top: 30,start: 20),
                      child: Text("Personal Expenses",style: GoogleFonts.aclonica(
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
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: getScreenSize(context).width-20,
                      height: 60,
                      child: Card(
                        child: CupertinoTextField(
                          controller: datCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Today Date ",
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

                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: getScreenSize(context).width-20,
                      height: 60,
                      child: Card(
                        child: CupertinoTextField(

                          controller: ownCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Personal Expenses",
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
                        child: CupertinoTextField(
                          controller: medicalCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Family Medical Expenses ",
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
                        child: CupertinoTextField(
                          controller: ramshaCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Ramsha Expenses",
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
                SizedBox(height: 30,),
              ],
            ),
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
                      controller: totalExpence,
                      readOnly: true,
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                      style: TextStyle(
                          fontSize: 22,
                          // fontWeight: FontWeight.w600,
                          color: Colors.black),
                      onTap: (){
                        int a = int.parse(medicalCtrl.text);
                        int b = int.parse(ownCtrl.text);
                        int c = int.parse(ramshaCtrl.text);
                        int f = (a+b+c);
                        totalExpence.text = f.toString();
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
                datCtrl.clear();
                ramshaCtrl.clear();
                ownCtrl.clear();
                medicalCtrl.clear();
                totalExpence.clear();
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
