import 'package:flutter/material.dart';
import 'package:trip_expense/models/Trip.dart';
import 'budget_view.dart';

class NewTriDateView extends StatelessWidget{
  final Trip trip;
  NewTriDateView({Key? key, required this.trip}) : super(key: key);//constructor of the class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip - Date'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,//center thay che
          children:<Widget>[
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,//center thay che
                children:<Widget>[
                  Text("Enter A Start Date"),
                  Text("Enter A End Date") ,
                  ],
                ) ,

            ElevatedButton (
                child:Text("Continue"),
                onPressed: (){
                  trip.startDate= DateTime.now();
                  trip.endDate= DateTime.now();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> NewTripBudgetView(trip:trip)),
                  );
                }
            )
          ],
        ),
      ),
    );
  }

}