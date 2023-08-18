import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trip_expense/models/Trip.dart';
import 'package:firebase_database/firebase_database.dart';

class NewTripBudgetView extends StatelessWidget {
  final db = FirebaseDatabase.instance;

  final Trip trip;
  NewTripBudgetView({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convert timestamps to DateTime objects
    DateTime startDate = trip.startDate;
    DateTime endDate = trip.endDate;


    // Format dates as "month/day/year"
    String formattedStartDate = DateFormat('MM/dd/yyyy').format(startDate);
    String formattedEndDate = DateFormat('MM/dd/yyyy').format(endDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip - Budget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Finish"),
            Text("Location: ${trip.title}"),
            Text("Start Date: $formattedStartDate"),
            Text("End Date: $formattedEndDate"),
            ElevatedButton(
              child: Text("Finish"),
              onPressed: () async {
                // Save data to Firebase
                await FirebaseDatabase.instance
                    .reference()
                    .child("trips")
                    .push()
                    .set(trip.toJson());

                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:trip_expense/models/Trip.dart';
// import 'package:firebase_database/firebase_database.dart';
//
//
// class NewTripBudgetView extends StatelessWidget{
//   final db = FirebaseDatabase.instance;//db instance
//
//
//   final Trip trip;
//   NewTripBudgetView({Key? key, required this.trip}) : super(key: key);//constructor of the class
//
//   @override
//   Widget build(BuildContext context) {
//     // Convert timestamps to DateTime objects
//     DateTime startDate = DateTime.fromMillisecondsSinceEpoch(trip.startDate);
//     DateTime endDate = DateTime.fromMillisecondsSinceEpoch(trip.endDate);
//
//     // Format dates as "month/day/year"
//     String formattedStartDate = DateFormat('MM/dd/yyyy').format(startDate);
//     String formattedEndDate = DateFormat('MM/dd/yyyy').format(endDate);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Trip - Budget'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,//center thay che
//           children:<Widget>[
//             Text("Finish") ,
//             Text("Location ${trip.title}") ,
//             Text("Start Date${trip.startDate}") ,
//             Text("End Date${trip.endDate}") ,
//
//
//             ElevatedButton (
//                 child:Text("Finish"),
//                 onPressed: () async{
//                   //save data to firebase
//                   await FirebaseDatabase.instance
//                       .reference()
//                       .child("trips")
//                       .push()
//                       .set(trip.toJson());//sending data in json from from here
//                       //check trip.dart file where data is being send to the db
//
//                   Navigator.of(context).popUntil((route) => route.isFirst);
//
//                 }
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
// }