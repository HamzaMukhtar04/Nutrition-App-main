// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe/model/meal.dart';

import 'package:recipe/screen/categorydata/foodsavailable.dart';
import 'package:recipe/screen/categorydata/statsdata.dart';
import 'package:recipe/screen/utiles/consts/colors.dart';
import 'package:recipe/screen/sidebar_screens/sidebar.dart';
import 'package:intl/intl.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Future<List<Meal>> getMeals() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection("meals")
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('dateTime',
            isEqualTo: DateTime(now.year, now.month, now.day))
        .get();
    var meals = querySnapshot.docs
        .map(
          (e) => Meal.fromMap(e.data()),
        )
        .toList();
    return meals;
  }

  DateTime now = DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    String formattedDate = formatter.format(now);
    return Scaffold(
      backgroundColor: background,
      drawer: Navbar(),
      appBar: AppBar(
           iconTheme: const IconThemeData(
      color: Colors.white, 
    ),centerTitle: true,
        title: Text("Eat Healthy",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
        backgroundColor: maincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    'Today,',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 7),
                  GestureDetector(
                    onTap: () async {
                      var dateTime = await showDatePicker(
                          context: context,
                          firstDate:
                              DateTime.now().subtract(Duration(days: 100)),
                          lastDate: DateTime.now().add(Duration(days: 100)));
                      if (dateTime != null) {
                        now = dateTime;
                        setState(() {});
                      }
                    },
                    child: Text(
                      formattedDate,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                height: 750,
                child: FutureBuilder(
                  future: getMeals(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.waiting){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 300.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    var list = snapshot.data;
                    if (list != null)
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(5),
                            child: ListTile(
                              tileColor: background,
                              title: Statsdata(
                                meals: list,
                                nowTime: now,
                              ),
                            ),
                          );
                        },
                      );
                    else
                      return SizedBox();
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 20, left: 5),
              //   child: Container(
              //     height: 230,
              //     child: FutureBuilder(
              //       future: getDocId(),
              //       builder: (context, snapshot) {
              //         return ListView.builder(
              //           physics: const NeverScrollableScrollPhysics(),
              //           itemCount: docIDs.length,
              //           itemBuilder: (context, index) {
              //             return Padding(
              //               padding: const EdgeInsets.all(15.5),
              //               child: ListTile(
              //                 tileColor: background,
              //                 title: Getfood(
              //                   documentId: docIDs[index],
              //                 ),
              //               ),
              //             );
              //           },
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
