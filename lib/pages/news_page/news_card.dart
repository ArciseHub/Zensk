import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/news_page/news_site.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class NewsCard extends StatelessWidget {
  final customColors = CustomColors();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewsSite()));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: customColors.headlineBoxColor,
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
