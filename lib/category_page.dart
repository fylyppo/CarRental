import 'package:flutter/material.dart';

import 'models/car.dart';
import 'presentation/offer/other_offer_widget.dart';
import 'server/car_list.dart';

class CategoryPage extends StatefulWidget {
  String category;

  CategoryPage(
    this.category, {
    Key? key,
  }) : super(key: key);

  @override
  _SportCarListState createState() => _SportCarListState();
}

class _SportCarListState extends State<CategoryPage> {
  late List<Car> _categoryList;

  @override
  void initState() {
    super.initState();
    _categoryList = carList
        .where((element) => element.category == widget.category)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: Text(
                widget.category,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
      body: Column(
      children: [
        SizedBox(height: 10,),
        ...(_categoryList.map((e) => OtherOfferWidget(
              car: e,))).toList()
      ],
    ),
    );
  }
}
