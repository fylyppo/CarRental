import 'package:flutter/material.dart';

class Car {
  int id;
  String name;
  int vMax;
  int price;
  int hP;
  double consumption;
  String category;
  String imageLink;

  Car({required this.id, required this.name, required this.vMax, required this.price, required this.hP, required this.imageLink, required this.category,required this.consumption});
}