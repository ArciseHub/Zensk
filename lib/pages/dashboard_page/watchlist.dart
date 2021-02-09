import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/chart_selected_time.dart';
import 'package:informatik_projekt/pages/dashboard_page/dividends.dart';
import 'package:informatik_projekt/pages/dashboard_page/littlePageCounter.dart';

class Watchlist extends StatelessWidget {
  static bool pushed;
  static bool pop;
  static String route = '/Watchlist';
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
                      'Watchlist',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'I have Number on my Watchlist',
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
                  Navigator.pushNamed(context, Dividends.route);
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
                    ChartSelectedTime(timeOrName: 'Stocks'),
                    ChartSelectedTime(timeOrName: 'Crypto'),
                    ChartSelectedTime(timeOrName: 'ETFs'),
                    ChartSelectedTime(timeOrName: 'Fonds'),
                    ChartSelectedTime(timeOrName: 'Real Estate'),
                    ChartSelectedTime(timeOrName: 'Bonds'),
                    ChartSelectedTime(timeOrName: 'Recourse\'s'),
                    ChartSelectedTime(timeOrName: 'Other'),
                  ],
                ),
              ),
            ),
          ),
        ),
        LittlePageCounter(
          c1: Colors.white60,
          c2: Colors.blue,
          c3: Colors.white60,
          c4: Colors.white60,
        ),
      ],
    );
  }
}
