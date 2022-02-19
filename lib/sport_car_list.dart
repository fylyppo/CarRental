import 'package:flutter/material.dart';

import 'models/car.dart';
import 'server/car_list.dart';

class SportCarList extends StatefulWidget {
  const SportCarList({ Key? key }) : super(key: key);

  @override
  _SportCarListState createState() => _SportCarListState();
}

class _SportCarListState extends State<SportCarList> {
  
  late List<Car> sportCarList;

  @override
  void initState() {
    super.initState();
    sportCarList = carList.where((element) => element.category == "Sport").toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}


