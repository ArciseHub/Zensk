import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/background_clipper.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final customColors = CustomColors();
  bool _dark = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  margin: EdgeInsets.zero,
                  height: 200,
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Switch(
                          activeColor:
                              customColors.navigationBarSelectedItemColor,
                          value: _dark,
                          onChanged: (state) {
                            setState(() {
                              _dark = state;
                            });
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 110, bottom: 30, left: 20, right: 20),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: customColors.mainBoxColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: customColors.shadowColor,
                          blurRadius: 7,
                          spreadRadius: 0,
                          offset: Offset(3, 4),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: customColors.mainBoxColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
