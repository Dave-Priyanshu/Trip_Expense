import 'dart:math';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:trip_expense/models/Trip.dart';
import 'budget_view.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart' as dp;
import 'package:intl/intl.dart';
import 'dart:async';


class NewTriDateView extends StatefulWidget{
  final Trip trip;
  NewTriDateView({Key? key, required this.trip}) : super(key: key);
  @override
  State<NewTriDateView> createState() => _NewTriDateViewState();
}

class _NewTriDateViewState extends State<NewTriDateView> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));


  Future displayDateRangePicker(BuildContext context) async {
    final picked = await showDateRangePicker(
      context : context,
      firstDate: new DateTime(DateTime.now().year -50),
      lastDate: new DateTime(DateTime.now().year +50),
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip - Date'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Location ${widget.trip.title}"),
            ElevatedButton(
              child : Text("Select Dates"),
                onPressed:() async {
                  await displayDateRangePicker(context);}
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Start Date: ${DateFormat('MM/dd/yyyy').format(_startDate).toString()}"),
                Text("End Date${DateFormat('MM/dd/yyyy').format(_endDate).toString()}"),
              ],
            ),
            ElevatedButton(
              child: Text("Continue"),
              onPressed: () {
                widget.trip.startDate = _startDate;
                widget.trip.endDate = _endDate;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewTripBudgetView(trip: widget.trip),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}