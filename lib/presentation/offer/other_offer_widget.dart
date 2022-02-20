import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/car.dart';
import 'package:flutter_assignment/presentation/core/size_config.dart';

class OtherOfferWidget extends StatelessWidget {
  Car car;

  OtherOfferWidget({
    Key? key,
    required this.car
  }) : super(key: key);

  void navigateToOfferPage(context) {
    Navigator.pushNamed(context, '/offer', arguments: car);
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToOfferPage(context);
        },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        height: SizeConfig.blockSizeVertical*9.25,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                width: SizeConfig.blockSizeHorizontal*62,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(car.name.toUpperCase(), style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal*4.5, fontWeight: FontWeight.bold),),
                    ),
                    StatsWidget(car: car)
                  ],
                ),
              ),
              Container(
                width: SizeConfig.blockSizeVertical*13,
                child: Hero(
                  tag: car.id,
                  child: Image.network(car.imageLink, fit: BoxFit.fill,)
                  ),
            )
            ],
          ),
        ),
      ),
    );
  }
}

class StatsWidget extends StatelessWidget {
  Car car;
  
  StatsWidget({
    Key? key,
    required this.car
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double fontSize = SizeConfig.blockSizeHorizontal*5.25;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(car.hP.toString(), style: TextStyle(fontSize: fontSize),),
            Text('HP', style: TextStyle(fontSize: fontSize/2),)
          ],
        ),
        Column(
          children: [
            Text(car.vMax.toString(), style: TextStyle(fontSize: fontSize),),
            Text('V-Max', style: TextStyle(fontSize: fontSize/2),)
          ],
        ),
        Column(
          children: [
            Text(car.consumption.toString(), style: TextStyle(fontSize: fontSize),),
            Text('L/100 KM', style: TextStyle(fontSize: fontSize/2),)
          ],
        ),
        Column(
          children: [
            Text(car.price.toString(), style: TextStyle(fontSize: fontSize),),
            Text('\$/Day', style: TextStyle(fontSize: fontSize/2),)
          ],
        ),
      ],
    );
  }
}
