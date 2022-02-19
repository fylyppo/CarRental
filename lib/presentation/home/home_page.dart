import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/account/account_page.dart';
import 'package:flutter_assignment/presentation/add/add_offer_page.dart';
import 'package:flutter_assignment/presentation/discover/discover_page.dart';
import 'package:flutter_assignment/presentation/options/options_page.dart';
import 'package:flutter_assignment/presentation/search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _currentPage = 0;
  int _currentScaffold = 1;
  
  List<Widget> pages = [
    DiscoverPage(),
    SearchPage(),
    AddOfferPage(),
    AccountPage(),
  ];
  late PageController _scaffoldController;

  @override
  void initState() {
    super.initState();
    _scaffoldController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _scaffoldController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return PageView(
        onPageChanged: (index) {
          setState(() => _currentScaffold = index);
        },
        controller: _scaffoldController,
        children: [
          OptionsPage(_scaffoldController),
          Scaffold(
            appBar: AppBar(
              title: const Text(
                'CarRental',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              leading:  IconButton(
                    onPressed: () {
                      setState(() {
                        _scaffoldController.previousPage(duration: Duration(milliseconds: 200), curve: Curves.ease);
                      });
                    }, icon: const Icon(Icons.menu)),
            ),
            body: pages[_currentPage],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Discover'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_box_outlined), label: 'Add'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box), label: 'Account'),
              ],
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              backgroundColor: Colors.black,
              currentIndex: _currentPage,
              onTap: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
        ],
      );
  }
}