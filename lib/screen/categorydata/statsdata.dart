// ignore_for_file: must_be_immutable, unused_import

import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recipe/model/meal.dart';
import 'package:recipe/screen/categorydata/detailed_meal_consumed.dart';
import 'package:recipe/screen/categorydata/edit_meals.dart';

import 'package:recipe/screen/consent/colors.dart';

class Statsdata extends StatefulWidget {
  Statsdata({
    Key? key,
    required this.meals,
    required this.nowTime,
  }) : super(key: key);
  final List<Meal> meals;
  final DateTime nowTime;

  @override
  State<Statsdata> createState() => _StatsdataState();
}

class _StatsdataState extends State<Statsdata> {
  List texts = [
    "Eat a variety of food.     Cut back on salt.     Reduce use of certain fats and oil.     Limit sugar intake.     Avoid hazardous and harmful alcohol use.",
    "Tap for more"
  ]; 

  double getCaloriesFromMeal(Meal meal) =>
      getCarbCalories(meal) + getProteinCalories(meal) + getFatCalories(meal);
  double getCarbCalories(Meal meal) => 4 * meal.carbs / 1000;
  double getProteinCalories(Meal meal) => 4 * meal.protein / 1000;
  double getFatCalories(Meal meal) => 9 * meal.fats / 1000;

  Meal getDefaultMeal() => Meal(
        name: '',
        detail: '',
        image: '',
        time: '',
        rating: '',
        isFavourite: false,
        carbs: 0,
        protein: 0,
        fats: 0,
        foodType: FoodType.breakfast,
        boost: '',
        fire: '',
        sausage: '',
        dateTime: DateTime.now(),
      );

  @override
  Widget build(BuildContext context) {
    var dinner = widget.meals.firstWhere(
      (element) => element.foodType == FoodType.dinner,
      orElse: getDefaultMeal,
    );
    var breakfast = widget.meals.firstWhere(
        (element) => element.foodType == FoodType.breakfast,
        orElse: getDefaultMeal);
    var lunch = widget.meals.firstWhere(
        (element) => element.foodType == FoodType.lunch,
        orElse: getDefaultMeal);
    return Builder(builder: (context) {
      // if (getCaloriesFromMeal(dinner) == null) {
      //   return Container(
      //     height: 680,
      //     child: Center(
      //       child: Padding(
      //         padding: const EdgeInsets.only(bottom: 10.0, left: 10),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.of(context).push(MaterialPageRoute(
      //                 builder: ((context) => EditMeals())));
      //           },
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Text(
      //                 'Please click',
      //                 style: TextStyle(
      //                     color: Colors.black,
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold),
      //               ),
      //               Text(
      //                 ' here ',
      //                 style: TextStyle(
      //                     color: Colors.blue,
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold),
      //               ),
      //               Text(
      //                 'to Start',
      //                 style: TextStyle(
      //                     color: Colors.blue,
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   );
      // } else {
      
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (widget.nowTime.hour >= 12 && widget.nowTime.hour < 19)
                    Text(
                      'GoodAfternoon,',
                      style: TextStyle(
                          color: Color.fromARGB(255, 75, 73, 73),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  if (widget.nowTime.hour > 18 && widget.nowTime.hour < 25)
                    Text(
                      'GoodEvening,',
                      style: TextStyle(
                          color: Color.fromARGB(255, 75, 73, 73),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  if (widget.nowTime.hour >= 0 && widget.nowTime.hour < 12)
                    Text(
                      'GoodMorning,',
                      style: TextStyle(
                          color: Color.fromARGB(255, 75, 73, 73),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    ''.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Today Report',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // -----------------INTAKE CONT
                      Flexible(
                        flex: 10,
                        child: IntakeContainer(
                          nowTime: widget.nowTime,
                          lunchTotal: getCaloriesFromMeal(lunch),
                          dinnerTotal: getCaloriesFromMeal(dinner),
                          breakfastTotal: getCaloriesFromMeal(breakfast),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      // BURNED CONT
                      Flexible(
                        flex: 10,
                        child: BurnContainer(
                            nowTime: widget.nowTime,
                            lunchTotal: getCaloriesFromMeal(lunch),
                            dinnerTotal: getCaloriesFromMeal(dinner),
                            breakfastTotal: getCaloriesFromMeal(breakfast)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Builder(builder: (context) {
                bool isAfternoon = widget.nowTime.hour >= 12 && widget.nowTime.hour < 19;
                bool isMorning = widget.nowTime.hour >= 0 && widget.nowTime.hour < 12;
                Meal currentMeal = isMorning
                    ? breakfast
                    : isAfternoon
                        ? lunch
                        : dinner;
                return StatsContainer(
                    fatsTotal: getFatCalories(currentMeal),
                    carbsTotal: getCarbCalories(currentMeal),
                    allTotal: getCaloriesFromMeal(currentMeal));
              }),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => Detailed_meal_consumed())));
                  },
                  child: Row(
                    children: [
                      Text(
                        'View',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        ' all',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        ' /',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        ' edit ',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        ' meals for  the day',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.lightbulb,
                    color: Colors.black,
                  ),
                  Text(
                    'Tips',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.rightSlide,
                    headerAnimationLoop: false,
                    title: 'Tips',
                    desc: texts.first,
                    btnOkOnPress: () {},
                    btnOkColor: Colors.red,
                  ).show();
                },
                child: Container(
                  height: 15,
                  color: Colors.orange,
                  child: SizedBox(),
                  // CarouselSlider.builder(
                  //   itemCount: texts.length,
                  //   options: CarouselOptions(
                  //     height: 20,
                  //     viewportFraction: 6,
                  //     initialPage: 0,
                  //     enableInfiniteScroll: true,
                  //     autoPlay: true,
                  //     autoPlayInterval: Duration(milliseconds: 2000),
                  //     autoPlayAnimationDuration:
                  //         Duration(milliseconds: 10000),
                  //     autoPlayCurve: Curves.easeInCirc,
                  //     enlargeCenterPage: false,
                  //     scrollDirection: Axis.horizontal,
                  //   ),
                  //   itemBuilder:
                  //       (BuildContext context, int index, int realIndex) {
                  //     return Text(texts[index],
                  //         style: TextStyle(
                  //           fontSize: 15,
                  //         ));
                  //   },
                  // ),
                ),
              ),
            ],
          ),
        ),
      );
    }
        // return Column(
        //   children: [
        //     Container(
        //       height: 680,
        //       child: Center(
        //         child: SpinKitCubeGrid(
        //           itemBuilder: (BuildContext context, int index) {
        //             return DecoratedBox(
        //               decoration: BoxDecoration(
        //                 color: index.isEven
        //                     ? Colors.blueAccent
        //                     : Colors.blueAccent,
        //               ),
        //             );
        //           },
        //           size: 50,
        //         ),
        //       ),
        //     ),
        //   ],
        // );
        // }
        );
  }
}

class StatsContainer extends StatelessWidget {
  const StatsContainer({
    super.key,
    required this.fatsTotal,
    required this.carbsTotal,
    required this.allTotal,
  });

  final double fatsTotal;
  final double carbsTotal;
  final double allTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background.withOpacity(.1),
        border: Border.all(style: BorderStyle.solid),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.black,
                    ),
                    Text(
                      'Stats',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            'Average nutrients present in the selected meals:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.withOpacity(.1),
                        ),
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: -1,
                                child: LinearPercentIndicator(
                                  width: 60,
                                  animation: true,
                                  lineHeight: 6,
                                  animationDuration: 2500,
                                  percent: fatsTotal / 12414.6,
                                  barRadius: Radius.circular(3),
                                  progressColor: Colors.green,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.blue.withOpacity(0.4),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 30,
                                    child: FittedBox(
                                      child: Text(
                                        "Fats",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Flexible(
                                    flex: 20,
                                    child: FittedBox(
                                      child: Text(
                                        fatsTotal.toStringAsFixed(2),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 15,
                                    child: FittedBox(
                                      child: Text(
                                        'kCal',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red.withOpacity(.1),
                        ),
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: -1,
                                child: LinearPercentIndicator(
                                  width: 60,
                                  animation: true,
                                  lineHeight: 6,
                                  animationDuration: 2500,
                                  percent: carbsTotal / 12414.6,
                                  barRadius: Radius.circular(3),
                                  progressColor: Colors.green,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.blue.withOpacity(0.4),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Flexible(
                                    flex: 30,
                                    child: Text(
                                      "Proteins",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Flexible(
                                    flex: 20,
                                    child: Text(
                                      carbsTotal.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 15,
                                    child: Text(
                                      'kCal',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green.withOpacity(.1),
                        ),
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: -1,
                                child: LinearPercentIndicator(
                                  width: 60,
                                  animation: true,
                                  lineHeight: 6,
                                  animationDuration: 2500,
                                  percent: carbsTotal / 12414.6,
                                  barRadius: Radius.circular(3),
                                  progressColor: Colors.green,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.blue.withOpacity(0.4),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 30,
                                    child: FittedBox(
                                      child: Text(
                                        "Carbs",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Flexible(
                                    flex: 20,
                                    child: FittedBox(
                                      child: Text(
                                        carbsTotal.toStringAsFixed(2),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 15,
                                    child: FittedBox(
                                      child: Text(
                                        "kCal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            'Total calories in kilos present in the todays meals:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Text(
                                  allTotal.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  " /",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  "${allTotal.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  " kcal",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if (allTotal > 2700)
                              InkWell(
                                onTap: () {},
                                child: RotatedBox(
                                  quarterTurns: 0,
                                  child: LinearPercentIndicator(
                                    width: 200,
                                    animation: true,
                                    lineHeight: 10,
                                    animationDuration: 2500,
                                    percent: allTotal.toDouble() / 12414.6,
                                    barRadius: Radius.circular(3),
                                    progressColor: Colors.red,
                                    padding: EdgeInsets.zero,
                                    backgroundColor:
                                        Colors.blue.withOpacity(0.4),
                                  ),
                                ),
                              ),
                            if (allTotal < 2700)
                              RotatedBox(
                                quarterTurns: 0,
                                child: LinearPercentIndicator(
                                  width: 200,
                                  animation: true,
                                  lineHeight: 6,
                                  animationDuration: 2500,
                                  percent: allTotal.toDouble() / 12414.6,
                                  barRadius: Radius.circular(3),
                                  progressColor: Colors.blue,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.blue.withOpacity(0.4),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Tips
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BurnContainer extends StatelessWidget {
  const BurnContainer({
    super.key,
    required this.nowTime,
    required this.lunchTotal,
    required this.dinnerTotal,
    required this.breakfastTotal,
  });

  final DateTime nowTime;
  final double lunchTotal;
  final double dinnerTotal;
  final double breakfastTotal;

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    return Container(
      width: mqSize.width * 0.42,
      height: mqSize.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
        border: Border.all(style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: FittedBox(
                    child: Text(
                      'Burned',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    child: Icon(
                      FontAwesomeIcons.fire,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 20,
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: FittedBox(
                      child: Text(
                        'Meal taken at: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 20,
                  child: SizedBox(
                    height: 80,
                    width: 3,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      value: 1,
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 2,
                // ),
                Flexible(
                  flex: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        if (nowTime.hour > 18 && nowTime.hour < 25)
                          Flexible(
                            flex: 60,
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      "Lunch time",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      'Total calories',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      lunchTotal.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (nowTime.hour >= 0 && nowTime.hour < 13)
                          Flexible(
                            flex: 60,
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      "Supper time",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      'Total calories',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      dinnerTotal.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (nowTime.hour > 12 && nowTime.hour < 19)
                          Flexible(
                            flex: 60,
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      "Breakfast time",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      'Total calories',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      breakfastTotal.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Flexible(
                          flex: 60,
                          child: FittedBox(
                            child: Text(
                              'kCal',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------

class IntakeContainer extends StatelessWidget {
  const IntakeContainer({
    super.key,
    required this.nowTime,
    required this.lunchTotal,
    required this.dinnerTotal,
    required this.breakfastTotal,
  });

  final DateTime nowTime;
  final double lunchTotal;
  final double dinnerTotal;
  final double breakfastTotal;

  @override
  Widget build(BuildContext context) {
    log('${lunchTotal.toString()} , ${dinnerTotal.toString()} , ${breakfastTotal.toString()}');
    final mqSize = MediaQuery.of(context).size;
    return Container(
      width: mqSize.width * 0.42,
      height: mqSize.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
        border: Border.all(style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: FittedBox(
                    child: Text(
                      'Intake',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    child: Icon(
                      FontAwesomeIcons.pizzaSlice,
                      color: Colors.orange,
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 20,
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: FittedBox(
                      child: Text(
                        'Meal taken at: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 20,
                  child: SizedBox(
                    height: 80,
                    width: 3,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      value: 1,
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  ),
                ),
                Flexible(
                  flex: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        if (nowTime.hour > 12 && nowTime.hour < 19)
                          Flexible(
                            flex: 60,
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      "Lunch time",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      'Total calories',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      lunchTotal.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (nowTime.hour > 18 && nowTime.hour < 25)
                          Flexible(
                            flex: 60,
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      "Supper time",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      'Total calories',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      dinnerTotal.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (nowTime.hour >= 0 && nowTime.hour < 13)
                          Flexible(
                            flex: 60,
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      "Breakfast time",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      'Total calories',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: FittedBox(
                                    child: Text(
                                      breakfastTotal.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Flexible(
                          flex: 60,
                          child: FittedBox(
                            child: Text(
                              'kCal',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
