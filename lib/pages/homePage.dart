
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usamaokharvichicken/Utils.dart';
import 'package:usamaokharvichicken/pages/carExpenses.dart';
import 'package:usamaokharvichicken/pages/groceryExpenses.dart';
import 'package:usamaokharvichicken/pages/homeExpense.dart';
import 'package:usamaokharvichicken/pages/shopExpenses.dart';
import 'package:usamaokharvichicken/saveDataFirebase/homeExpensesData.dart';
import 'package:usamaokharvichicken/saveDataFirebase/personalExpensesData.dart';
import 'package:usamaokharvichicken/saveDataFirebase/shopExpensesData.dart';
import 'package:usamaokharvichicken/saveDataFirebase/vehicalExpensesData.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: Text(
          "Usama Chicken Center",
          style: GoogleFonts.aclonica(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      endDrawer: Drawer(
        elevation: 50,
        child: ListView(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      "images/logo.jpg",
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () => navigate(context, HomeData()),
                    child: Container(
                      padding: EdgeInsetsDirectional.only(start: 10,end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Home Expenses Data",
                              style: GoogleFonts.aclonica(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Icon(Icons.info),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                   onTap: () => navigate(context, ShopData()),
                    child: Container(
                      padding: EdgeInsetsDirectional.only(start: 10,end: 10),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Shop Expenses Data",
                              style: GoogleFonts.aclonica(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Icon(Icons.info),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: ()=> navigate(context, PersonalData()),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Personal Expenses Data",
                              style: GoogleFonts.aclonica(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Icon(Icons.info),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: ()=>navigate(context, VehicalsData()),
                    child: Container(
                      padding: EdgeInsetsDirectional.only(start: 10,end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Vehicals Expenses Data",
                              style: GoogleFonts.aclonica(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Icon(Icons.info),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

      body: SafeArea(
          child: ListView(children: [
        SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            child: Image.asset(
              "images/logo.jpg",
              height: 250,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () => navigate(context, HomeExpence()),
          child: Container(
              height: 130,
              width: getScreenSize(context).width - 20,
              child: Card(
                elevation: 20,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Home Expenses",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aclonica(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ]),
              )),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () => navigate(context, CarExpenses()),
          child: Container(
              height: 130,
              width: getScreenSize(context).width - 20,
              child: Card(
                elevation: 20,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Vehicles Expenses",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aclonica(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ]),
              )),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () => navigate(context, GroceryExpenses()),
          child: Container(
              height: 130,
              width: getScreenSize(context).width - 20,
              child: Card(
                elevation: 20,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Shop Expenses",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aclonica(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ]),
              )),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () => navigate(context, ShopExpenses()),
          child: Container(
              height: 130,
              width: getScreenSize(context).width - 20,
              child: Card(
                elevation: 20,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Personal Expenses",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aclonica(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ]),
              )),
        ),
        SizedBox(
          height: 30,
        )
      ])),
    );
  }
}
