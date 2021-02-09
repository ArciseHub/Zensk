import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/barchart.dart';
import 'package:informatik_projekt/pages/dashboard_page/chart_selected_time.dart';
import 'package:informatik_projekt/pages/dashboard_page/littlePageCounter.dart';
import 'package:informatik_projekt/pages/dashboard_page/set_goal.dart';

class Dividends extends StatelessWidget {
  static String route = '/Dividends';
  static bool pop;
  static bool push;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: 30,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Dividends',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'I have collected Number dividends',
                    style: TextStyle(
                      color: Colors.white30,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pushNamed(context, SetGoal.route);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Container(
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white30,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 7.5, right: 7.5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ChartSelectedTime(timeOrName: 'January'),
                    ChartSelectedTime(timeOrName: 'February'),
                    ChartSelectedTime(timeOrName: 'March'),
                    ChartSelectedTime(timeOrName: 'April'),
                    ChartSelectedTime(timeOrName: 'May'),
                    ChartSelectedTime(timeOrName: 'June'),
                    ChartSelectedTime(timeOrName: 'July'),
                    ChartSelectedTime(timeOrName: 'August'),
                    ChartSelectedTime(timeOrName: 'September'),
                    ChartSelectedTime(timeOrName: 'October'),
                    ChartSelectedTime(timeOrName: 'November'),
                    ChartSelectedTime(timeOrName: 'December'),
                    ChartSelectedTime(timeOrName: '1 Year'),
                    ChartSelectedTime(timeOrName: '3 Years'),
                    ChartSelectedTime(timeOrName: 'Total'),
                  ],
                ),
              ),
            ),
          ),
        ),
        DividendBarChart(),
        LittlePageCounter(
          c1: Colors.white60,
          c2: Colors.white60,
          c3: Colors.blue,
          c4: Colors.white60,
        ),
      ],
    );
  }
}
