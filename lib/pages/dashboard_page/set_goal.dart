import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/littlePageCounter.dart';

class SetGoal extends StatelessWidget {
  static String route = '/SetGoal';
  static bool pop;
  static bool pushed = false;
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
                      'Goal',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'I have reached my goal to ...%',
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
                  color: Colors.white60,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        LittlePageCounter(
          c1: Colors.white60,
          c2: Colors.white60,
          c3: Colors.white60,
          c4: Colors.blue,
        ),
      ],
    );
  }
}
