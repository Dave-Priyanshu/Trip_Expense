class Trip{
   String title;
   int startDate;
   int endDate;
   double budget;
   String travelType;

  Trip(
      this.title,
      this.startDate,
      this.endDate,
      this.budget,
      this.travelType);


  //sending the data to the database from budget_view.dart
  Map<String,dynamic> toJson() =>{
     'trip': title,
     //need to convert the DateTime object into a format that can be
     // stored in Firebase. One common approach is to convert the DateTime
     // object to a timestamp or a string before sending it to Firebase.
     // Convert DateTime to timestamp//
     'startDate': startDate,
     'endDate': endDate  ,
     'budget':budget,
     'traveltype': travelType
  };

}

