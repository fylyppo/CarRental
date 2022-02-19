import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/car.dart';
import 'package:flutter_assignment/presentation/offer/other_offer_widget.dart';
import 'package:flutter_assignment/server/car_list.dart';

class OtherOffersWidget extends StatefulWidget {
  const OtherOffersWidget({Key? key}) : super(key: key);

  @override
  State<OtherOffersWidget> createState() => _OtherOffersState();
}

class _OtherOffersState extends State<OtherOffersWidget> {
  _OtherOffersState();

  List<Car> _otherOffersList = carList;
  
  @override
  void initState() {
    _otherOffersList = _otherOffersList.getRange(3, _otherOffersList.length).toList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...(_otherOffersList.map((e) => OtherOfferWidget(
              car: e,))).toList()
      ],
    );
  }
}
