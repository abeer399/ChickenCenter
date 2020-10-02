import 'package:flutter/material.dart';

Size getScreenSize(BuildContext context) => MediaQuery.of(context).size;


navigate(BuildContext context,Widget route){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route)
  );
}
