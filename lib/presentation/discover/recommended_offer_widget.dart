import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/car.dart';
import 'package:flutter_assignment/presentation/core/size_config.dart';
import 'package:flutter_assignment/presentation/offer/other_offer_widget.dart';

class RecommendedOfferWidget extends StatelessWidget {
  Car car;
  RecommendedOfferWidget({
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
      child: Stack(
        children: [
          Hero(
            tag: car.id,
            child: Image.network(
              car.imageLink,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: SizeConfig.blockSizeVertical*5,
                    child: StatsWidget(car: car))),
          ),
        ],
      ),
    );
  }
}
