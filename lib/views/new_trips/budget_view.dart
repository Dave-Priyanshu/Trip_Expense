import 'package:flutter/material.dart';
import 'package:trip_expense/models/Trip.dart';

class NewTripBudgetView extends StatelessWidget{
  final Trip trip;
  NewTripBudgetView({Key? key, required this.trip}) : super(key: key);//constructor of the class

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip - Budget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,//center thay che
          children:<Widget>[
            Text("Finish") ,
            Text("Location ${trip.title}") ,
            Text("Start Date${trip.startDate}") ,
            Text("End Date${trip.endDate}") ,


            ElevatedButton (
                child:Text("Finish"),
                onPressed: (){
                  //save data to firebase


                  Navigator.of(context).popUntil((route) => route.isFirst);

                }
            )
          ],
        ),
      ),
    );
  }

}