import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_assignment/models/car.dart';
import 'package:flutter_assignment/presentation/core/size_config.dart';
import 'package:flutter_assignment/presentation/offer/offer_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OfferPage extends StatefulWidget {
  Car car;

  OfferPage(this.car, {Key? key}) : super(key: key);

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  
  List<Map> carPerformance = [];
  bool isSport = false;
  @override
  void initState() {
    carPerformance = [
      {
        'value': widget.car.hP,
        'icon': MdiIcons.horseVariantFast,
        'text': 'HP',
      },
      {
        'value': widget.car.vMax,
        'icon': MdiIcons.cameraTimer,
        'text': 'KM/H',
      },
      {
        'value': widget.car.consumption,
        'icon': MdiIcons.gasStation,
        'text': 'L/100KM',
      },
      {
        'value': widget.car.price,
        'icon': MdiIcons.currencyUsd,
        'text': '\$/Day',
      },
      {
        'value': widget.car.category,
        'icon': MdiIcons.carSports,
        'text': '',
      },
    ];
    super.initState();
  }

  Color? _colorPicker(int index){
    if(carPerformance[index]['value'].toString() == 'Sport'){
    return Colors.red;
    }else {
      return Theme.of(context).dividerColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.name),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: OfferImageWidget(widget.car),
        ),
        SliverPadding(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 8.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _GridElement(context, index);
              },
              childCount: 5,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 8.0),
        )
      ]),
    );
  }

  Widget _GridElement(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ]),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  carPerformance[index]['icon'],
                  size: 40,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    carPerformance[index]['value'].toString(),
                    style: TextStyle(
                    
                    color: _colorPicker(index),
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(carPerformance[index]['text'], style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
