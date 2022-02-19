import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/car.dart';

class OfferImageWidget extends StatelessWidget {
  Car car;
   OfferImageWidget(this.car, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 240,
            width: double.infinity,
            child: Hero(
                tag: car.id,
                child: Image.network(
                  car.imageLink,
                  fit: BoxFit.fill,
                )),
          );
  }
}