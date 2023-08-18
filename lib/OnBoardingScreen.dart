import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trip_expense/Home_widget.dart';
import 'package:trip_expense/intro_screens/intro_page_1.dart';
import 'package:trip_expense/intro_screens/intro_page_2.dart';
import 'package:trip_expense/pages.dart';
import 'package:trip_expense/views/new_trips/location_view.dart';

class OnBoardingScreen extends StatefulWidget {


  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //controller to keep track on which page we're on
  PageController _controller = PageController();

  //keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //page view
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage =(index ==1);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2()
            ],
          ), // <-- Add a comma here

          //dot indicator
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(1);
                  },
                    child: Text('Skip'),
                ),
      
                //dot indicator
                SmoothPageIndicator(controller: _controller, count: 2),

                //next or done
                onLastPage?
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(
                        builder:(context){
                          return Home();
                        },
                     ),
                    );
                  },
                  child:  Text('Done'),
                )
                : GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child:  Text('Next'),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
