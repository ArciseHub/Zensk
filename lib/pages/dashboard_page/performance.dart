import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/chart_selected_time.dart';
import 'package:informatik_projekt/pages/dashboard_page/littlePageCounter.dart';
import 'package:informatik_projekt/pages/dashboard_page/watchlist.dart';
import 'linechart.dart';

class Performance extends StatelessWidget {
  static bool pushed;
  static bool pop;
  static String route = '/Performance';
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
                  color: Colors.white60,
                ),
                onTap: () {},
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Performance',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'On Date Month Year, I had Amount',
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
                  Navigator.pushNamed(context, Watchlist.route);
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
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    ChartSelectedTime(timeOrName: 'Day'),
                    ChartSelectedTime(timeOrName: 'Week'),
                    ChartSelectedTime(timeOrName: 'Month'),
                    ChartSelectedTime(timeOrName: '6 Months'),
                    ChartSelectedTime(timeOrName: 'YTD'),
                    ChartSelectedTime(timeOrName: '1 Year'),
                    ChartSelectedTime(timeOrName: '3 Years'),
                    ChartSelectedTime(timeOrName: '5 Years'),
                    ChartSelectedTime(timeOrName: 'Max'),
                  ],
                ),
              ),
            ),
          ),
        ),
        PerformanceLineChart(),
        LittlePageCounter(
          c1: Colors.blue,
          c2: Colors.white60,
          c3: Colors.white60,
          c4: Colors.white60,
        ),
      ],
    );
  }
}
