import 'package:flutter/material.dart';
import 'Trip.dart';
import 'package:intl/intl.dart';
class HomeView extends StatelessWidget{
  final List<Trip> tripsList=[
    Trip("New York", DateTime.now(), DateTime.now(), 2000, "car"),
    Trip("Boston", DateTime.now(), DateTime.now(), 3000, "plane"),
    Trip("Jaipur", DateTime.now(), DateTime.now(), 4000, "bike"),
    Trip("Dubai", DateTime.now(), DateTime.now(), 5000, "plane"),
    Trip("Ahmedabad", DateTime.now(), DateTime.now(), 6000, "car"),

  ];
  @override
  Widget build(BuildContext context) {

    return Container(
     child: new ListView.builder(
       itemCount: tripsList.length,
       itemBuilder: (BuildContext context,int index)=> buildTripCard( context, index )
     ),
    );
  }
  //trip cards widget on the home pade
  Widget buildTripCard (BuildContext context,int index ){
    final trip =tripsList[index];
    return new Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(top:8.0, bottom: 4),
                  child: Row(
                    children:<Widget>[
                      Text(trip.title, style: new TextStyle(fontSize: 30),),
                      Spacer(),
                  ]
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:4.0, bottom: 80),
                  child: Row(
                      children:<Widget>[
                    Text("${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} -${DateFormat('dd/MM/yyyy').format(trip.endDate).toString()}"),
                        Spacer(),
                    ]
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:8.0, bottom: 8),
                  child: Row(
                    children: <Widget>[
                      Text(trip.budget.toStringAsFixed(2), style: new TextStyle(fontSize: 29),),
                      Spacer(),
                      Icon(Icons.directions_car)
                      // Text(trip.travelType)


                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );

  }
}