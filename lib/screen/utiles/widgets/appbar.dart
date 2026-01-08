import 'package:flutter/material.dart';
import 'package:recipe/screen/utiles/consts/colors.dart';

PreferredSizeWidget appbar(context) {
  return AppBar(
    centerTitle: true,
       iconTheme: const IconThemeData(
      color: Colors.white, 
    ),
    title: Text("Mobile Nutrition",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
    
    backgroundColor: maincolor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
  );
}
