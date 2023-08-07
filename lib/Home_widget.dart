import 'package:flutter/material.dart';
import 'package:trip_expense/pages.dart';
import 'home_view.dart';

class Home extends StatefulWidget{
  //top and bottm navigations and page main display
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  int _currentIndex =0;
  final List<Widget>_children=[
  HomeView(),
  ExplorePage(),
  PastTripsPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Expense Manager"),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: ("Home"),
          ),

          BottomNavigationBarItem(
          icon: new Icon(Icons.explore),
            label: ("Explore"),
          ),

          BottomNavigationBarItem(
          icon: new Icon(Icons.history),
            label: ("Past Trips"),
          ),
        ]
      ),
    );
  }
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}

