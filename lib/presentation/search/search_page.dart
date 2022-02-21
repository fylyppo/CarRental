import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_assignment/models/car.dart';
import 'package:flutter_assignment/presentation/core/size_config.dart';
import 'package:flutter_assignment/presentation/offer/offer_image.dart';
import 'package:flutter_assignment/server/car_list.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map> categories = [];
  bool isSport = false;
  late List<Car> _categoryList;

  @override
  void initState() {
    categories = [
      {
      'value' : 'Sport',
      'icon' : MdiIcons.speedometer,
      'maincolor': Colors.red,
      'secondcolor': Colors.red
      },
      {
      'value' : 'Electric',
      'icon' : MdiIcons.lightningBolt,
      'maincolor': Colors.green,
      'secondcolor': Colors.amberAccent
      },
      {
      'value' : 'Pickup',
      'icon' : MdiIcons.carLiftedPickup,
      'maincolor': Colors.black,
      'secondcolor': Colors.black
      },
      {
      'value' : 'City',
      'icon' : MdiIcons.city,
      'maincolor': Colors.blue,
      'secondcolor': Colors.grey
      },
      {
      'value' : 'Luxury',
      'icon' : MdiIcons.diamondStone,
      'maincolor': Colors.amber,
      'secondcolor': Colors.blue[400],
      },
    ];
    super.initState();
  }

  int quantity(int index){
    return carList
        .where((element) => element.category == categories[index]['value'])
        .toList().length;
  }

  String checkIf1(int quantity){
    if(quantity == 1)
      return '1 offer';
      else return '$quantity offers';
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      // SliverToBoxAdapter(
      //   child: OfferImageWidget(widget.car),
      // ),
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
    ]);
  }



  void _navigateToCategoryPage(context, index) {
    Navigator.pushNamed(context, '/category', arguments: categories[index]['value']);
  }

  Widget _GridElement(BuildContext context, int index) {
    int offersQuantity = quantity(index);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          _navigateToCategoryPage(context, index);
        },
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
                    categories[index]['icon'],
                    size: 40,
                    color: categories[index]['secondcolor'],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      categories[index]['value'],
                      style: TextStyle(
                          color: categories[index]['maincolor'],
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Text(
                    checkIf1(offersQuantity),
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
