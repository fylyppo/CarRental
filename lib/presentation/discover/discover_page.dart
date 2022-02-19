import 'package:flutter/material.dart';
import 'carousel_widget.dart';
import 'other_offers_widget.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final List<Widget> _discoverPageList = [
    CarouselWidget(),
    OtherOffersWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _discoverPageList.length,
      itemBuilder: (context, index){
        return _discoverPageList[index];
      }
      );
  }
}
