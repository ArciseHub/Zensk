import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/background_clipper.dart';
import 'package:informatik_projekt/pages/search_page/search_asset_selecter.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final customColors = CustomColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  margin: EdgeInsets.zero,
                  height: 170,
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
                        'Search',
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
                  SearchAssetSelecter(asset: 'Stocks'),
                  SearchAssetSelecter(asset: 'Crypto'),
                  SearchAssetSelecter(asset: 'ETFs'),
                  SearchAssetSelecter(asset: 'Fonds'),
                  SearchAssetSelecter(asset: 'Bonds'),
                  SearchAssetSelecter(asset: 'Recourse\s'),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 550,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: customColors.mainBoxColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: Text(
                          'Most Searched',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
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
