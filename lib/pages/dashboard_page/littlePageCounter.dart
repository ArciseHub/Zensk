import 'package:flutter/material.dart';

class LittlePageCounter extends StatelessWidget {
  LittlePageCounter(
      {@required this.c1,
      @required this.c2,
      @required this.c3,
      @required this.c4});
  final Color c1;
  final Color c2;
  final Color c3;
  final Color c4;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 7.5),
            height: 5,
            width: 20,
            decoration: BoxDecoration(
              color: c1,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 7.5),
            height: 5,
            width: 20,
            decoration: BoxDecoration(
              color: c2,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 7.5),
            height: 5,
            width: 20,
            decoration: BoxDecoration(
              color: c3,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 7.5),
            height: 5,
            width: 20,
            decoration: BoxDecoration(
              color: c4,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
