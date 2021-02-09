import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/background_clipper.dart';
import 'package:informatik_projekt/pages/news_page/news_card.dart';
import 'package:informatik_projekt/pages/news_page/news_type_scroller.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final customColors = CustomColors();
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
                  height: 100,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'News',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NewsTypeScroller(newsName: 'Selected'),
                  NewsTypeScroller(newsName: 'Market'),
                  NewsTypeScroller(newsName: 'Stocks'),
                  NewsTypeScroller(newsName: 'Crypto'),
                  NewsTypeScroller(newsName: 'ETFs'),
                  NewsTypeScroller(newsName: 'Fonds'),
                  NewsTypeScroller(newsName: 'Bonds'),
                  NewsTypeScroller(newsName: 'Recourse\'s'),
                ],
              ),
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
                    children: [
                      NewsCard(),
                      NewsCard(),
                    ],
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
