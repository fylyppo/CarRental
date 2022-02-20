import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/core/size_config.dart';
import 'package:flutter_assignment/server/car_list.dart';

import 'recommended_offer_widget.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({ Key? key }) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<CarouselWidget> {
  
   int _currentPage = 0;
  PageController _pageViewController = PageController();
  late Timer _timer;

 @override
void initState() {
  super.initState();
  _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
    if (_currentPage < 2) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }

    _pageViewController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  });
}

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
            height: SizeConfig.blockSizeVertical*28,
            child: PageView.builder(
                allowImplicitScrolling: true,
                controller: _pageViewController,
                itemCount: carList == null ? 0 : (carList.length > 3 ? 3 : carList.length),
                itemBuilder: (context, index) {
                  return RecommendedOfferWidget(
                    car: carList[index],
                  );
                }),
          ),
    );
  }
}