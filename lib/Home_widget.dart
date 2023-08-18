import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trip_expense/pages.dart';
import 'package:trip_expense/views/new_trips/location_view.dart';
import 'views/home_view.dart';
import 'package:trip_expense/views/new_trips/location_view.dart';
import 'package:trip_expense/models/Trip.dart';

void main() async {
  // Ensure that Firebase is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Expense Manager',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    ExplorePage(),
    PastTripsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final newTrip = Trip("some trip", DateTime.now(), DateTime.now(), 0.0, "some location");

    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Expense Manager"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewTripLocationView(trip: newTrip)),
              );
            },
          )
        ],
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
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
