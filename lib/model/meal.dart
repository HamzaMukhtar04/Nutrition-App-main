// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';


enum FoodType{breakfast , lunch , dinner}

class Meal {
  String name;
  String detail;
  String image;
  String time;
  String rating;
  String boost;
  String fire;
  bool isFavourite;
  double carbs;
  double protein;
  String sausage;
  double fats;  
  FoodType foodType;
  DateTime dateTime;

  Meal({
    required this.name,
    required this.detail,
    required this.image,
    required this.time,
    required this.rating,
    required this.isFavourite,
    required this.carbs,
    required this.protein,
    required this.fats,
    required this.foodType,
    required this.boost,
    required this.fire , 
    required this.sausage,    
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'detail': detail,
      'image': image,
      'time': time,
      'rating': rating,
      'isFavourite': isFavourite,
      'carbs': carbs,
      'protein': protein,
      'fats': fats,
      'foodType': foodType.index,
      'sausage' : sausage,
      'fire' : fire,
      'boost' : boost,
      'dateTime' : DateTime(dateTime.year , dateTime.month , dateTime.day),
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      name: map['name'] as String,
      detail: map['detail'] as String,
      image: map['image'] as String,
      time: map['time'] as String,
      rating: map['rating'] as String,
      isFavourite: map['isFavourite'] as bool,
      carbs: map['carbs'] as double,
      protein: map['protein'] as double,
      fats: map['fats'] as double,
      foodType: FoodType.values[map['foodType'] as int],
      boost: map['boost'] as String,
      fire: map['fire'] as String,
      sausage: map['sausage'] as String,
      dateTime: (map['dateTime'] as Timestamp).toDate(),
    );
  }
}
