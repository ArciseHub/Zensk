import 'package:flutter/material.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class NewsTypeScroller extends StatefulWidget {
  NewsTypeScroller({@required this.newsName});
  final String newsName;

  @override
  _NewsTypeScrollerState createState() => _NewsTypeScrollerState();
}

class _NewsTypeScrollerState extends State<NewsTypeScroller> {
  final customColors = CustomColors();
  bool enabled = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: 20),
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            color: (enabled
                ? customColors.navigationBarSelectedItemColor
                : customColors.mainBoxColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: customColors.shadowColor,
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(3, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.newsName,
              style: TextStyle(
                color: (enabled ? Colors.white : Colors.white60),
                fontSize: 15.75,
              ),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            if (enabled == false) {
              enabled = true;
            } else {
              enabled = false;
            }
          });
        },
      ),
    );
  }
}
