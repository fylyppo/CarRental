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
        height: 78,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                width: 245,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(car.name.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(car.hP.toString(), style: TextStyle(fontSize: 20),),
            Text('HP', style: TextStyle(fontSize: 10),)
          ],
        ),
        Column(
          children: [
            Text(car.vMax.toString(), style: TextStyle(fontSize: 20),),
            Text('V-Max', style: TextStyle(fontSize: 10),)
          ],
        ),
        Column(
          children: [
            Text(car.consumption.toString(), style: TextStyle(fontSize: 20),),
            Text('L/100 KM', style: TextStyle(fontSize: 10),)
          ],
        ),
        Column(
          children: [
            Text(car.price.toString(), style: TextStyle(fontSize: 20),),
            Text('\$/Day', style: TextStyle(fontSize: 10),)
          ],
        ),
      ],
    );
  }
}
