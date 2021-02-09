import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/NavigationOfWidgets.dart';
import 'package:informatik_projekt/pages/dashboard_page/background_clipper.dart';
import 'package:informatik_projekt/pages/dashboard_page/currencyChanger.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final customColors = CustomColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: customColors.headlineBoxColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: customColors.shadowColor,
                        blurRadius: 5,
                        spreadRadius: 0,
                        offset: Offset(3, 4),
                      ),
                    ],
                  ),
                  child: ClipPath(
                    clipper: BackgroundThingy(),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: customColors.headlineBoxColorAccent,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 130, bottom: 10),
                      child: Text(
                        'Today I have',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 17.5,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            'SGD',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 17.5,
                            ),
                          ),
                        ),
                        Text(
                          '503,464.59',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'I have earned', // I have lost
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Amount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Stack(
                              children: [
                                Container(
                                  height: 35,
                                  width: 1,
                                  color: Colors.white24,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Percentage gained', // Percentage dropped
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Amount%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CurrencyChanger(
                    currency: 'US-Dollar',
                    amount: 1387193.32,
                  ),
                  CurrencyChanger(
                    currency: 'EUR',
                    amount: 1938521.2,
                  ),
                  CurrencyChanger(
                    currency: 'NOK',
                    amount: 129379521.21,
                  ),
                  CurrencyChanger(
                    currency: 'CHF',
                    amount: 918375.83,
                  ),
                  CurrencyChanger(
                    currency: 'SEK',
                    amount: 13759813.12,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: customColors.mainBoxColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: NavigationOfWidgets(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
