import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:trip_expense/Home_widget.dart';
import 'package:trip_expense/OnBoardingScreen.dart';

import 'OnBoardingScreen.dart';
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trip Expense Manager",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: OnBoardingScreen(),
    );
  }
}
// class test extends StatelessWidget {
//   const test({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     DatabaseReference ref = FirebaseDatabase.instance.ref("testing");
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // DatabaseReference ref = FirebaseDatabase.instance.ref("testing");
//           final String? id = ref.push().key;
//           ref.child(id!).set({
//             'timestamp': DateTime.now().toString(),
//           });
//           // print("name: " + ref.name)
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: StreamBuilder(
//         stream: ref.onValue,
//         builder: (context, snapshot) {
//           List<String> messageList = [];
//           // if (!snapshot.hasData) {
//           //   return const SizedBox.shrink();
//           // }
//           if (snapshot.hasData && snapshot.data != null && (snapshot.data!).snapshot.value !=
//               null) {
//             final messageMap = Map<dynamic, dynamic>.from((snapshot.data!).snapshot.value
//             as Map<dynamic, dynamic>);
//             messageMap.forEach((key, value) {
//               final current = Map<dynamic, dynamic>.from(value);
//               messageList.add(current['timestamp'] as String);
//             });
//             return ListView.builder(
//               itemCount: messageList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(messageList[index].toString()),
//                 );
//               },
//             );
//           } else {
//             return const Center(
//               child: Text(
//                 'Say Hi...',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 21,
//                     fontWeight: FontWeight.w400),
//               ),
//             );
//           }
//         },
//       ),
//
//     );
//   }
// }
