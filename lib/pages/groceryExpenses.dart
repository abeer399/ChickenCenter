
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:usamaokharvichicken/Utils.dart';
import 'package:usamaokharvichicken/pages/homePage.dart';

class GroceryExpenses extends StatefulWidget {

  @override
  _GroceryExpensesState createState() => _GroceryExpensesState();
}

class _GroceryExpensesState extends State<GroceryExpenses> {
  saveData() {
    final DatabaseReference database = FirebaseDatabase.instance.reference().child("ShopExpense");
    String purchase = purchaseCtrl.text;
    String sale = saleCtrl.text;
    String food = foodCtrl.text;
    String tea = teaCtrl.text;
    String worker = workerCtrl.text;
    String committee = committeeCtrl.text;
    String debit = debitCtrl.text;
    String credit = creditCtrl.text;
    String other = othersCtrl.text;
    String date = dateCtrl.text;
    String totalshop =totalShop.text;
    String id = database.push().key;

    database.child(id).set({
      "id" : id,
      "date" : date,
      "purchase" : purchase,
      "sale" : sale,
      "food" : food,
      "tea" : tea,
      "worker" : worker,
      "committee" : committee,
      "debit" : debit,
      "creadit" : credit,
      "other" : other,
      "totalshop" : totalshop

    });
  }
  DateTime _dateTime = new DateTime.now();

  TextEditingController dateCtrl = TextEditingController();
  TextEditingController purchaseCtrl = TextEditingController();
  TextEditingController saleCtrl = TextEditingController();
  TextEditingController foodCtrl = TextEditingController();
  TextEditingController teaCtrl = TextEditingController();
  TextEditingController workerCtrl = TextEditingController();
  TextEditingController committeeCtrl = TextEditingController();
  TextEditingController debitCtrl = TextEditingController();
  TextEditingController creditCtrl = TextEditingController();
  TextEditingController othersCtrl = TextEditingController();
  TextEditingController totalShop = TextEditingController();

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
        title: Text("Shop Expenses",style: GoogleFonts.aclonica(
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
                  child: Text("Shop Expenses",style: GoogleFonts.aclonica(
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
                        child: CupertinoTextField(
                          controller: purchaseCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Chicken Purchase Amount",
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
                          controller: saleCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Chicken Sale Amount",
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
                          controller: foodCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Shop Food Amount",
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
                          controller: teaCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Shop Tea Amount",
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
                          controller: workerCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Workers Wages",
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
                          controller: committeeCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Shop Committee Amount",
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
                          controller: debitCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Chicken Debit Amount",
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
                          controller: creditCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Chicken Credit Amount",
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
                          controller: othersCtrl,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Other Expenses",
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
                )
              ],
            ),
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
                      controller: totalShop,
                      readOnly: true,
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                      style: TextStyle(
                          fontSize: 22,
                          // fontWeight: FontWeight.w600,
                          color: Colors.black),
                      onTap: (){
                        int j = int.parse(purchaseCtrl.text);
                        int a = int.parse(saleCtrl.text);
                        int b = int.parse(foodCtrl.text);
                        int c = int.parse(teaCtrl.text);
                        int d = int.parse(workerCtrl.text);
                        int e = int.parse(committeeCtrl.text);
                        int g = int.parse(debitCtrl.text);
                        int h = int.parse(creditCtrl.text);
                        int i = int.parse(othersCtrl.text);
                        int f = (a+b+c+d+e+g+h+i+j);
                        totalShop.text = f.toString();
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
                purchaseCtrl.clear();
                saleCtrl.clear();
                foodCtrl.clear();
                teaCtrl.clear();
                workerCtrl.clear();
                committeeCtrl.clear();
                debitCtrl.clear();
                creditCtrl.clear();
                othersCtrl.clear();
                totalShop.clear();
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
