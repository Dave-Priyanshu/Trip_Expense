import 'package:flutter/material.dart';
import 'package:trip_expense/models/Trip.dart';
import 'date_view.dart';

class NewTripLocationView extends StatelessWidget{
  final Trip trip;
  NewTripLocationView({Key? key, required this.trip}) : super(key: key);//constructor of the class

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = new TextEditingController();
    _titleController.text = trip.title;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip - Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,//center thay che
          children:<Widget>[
            Text("Enter A Location") ,
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: _titleController,
                autofocus: true,
             ),
            ),
            ElevatedButton (
              child:Text("Continue"),
              onPressed: (){
                trip.title = _titleController.text;//when we click continue the trip title will get set here
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> NewTriDateView(trip:trip)),
                );
              }
            )
          ],
        ),
      ),
    );
  }

}