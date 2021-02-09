import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/background_clipper.dart';
import 'package:informatik_projekt/pages/portfolio_page/AssetChart.dart';
import 'package:informatik_projekt/pages/portfolio_page/asset_card.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:informatik_projekt/pages/portfolio_page/popup.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final customColors = CustomColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: customColors.backgroundColor,
        shadowColor: Colors.transparent,
        toolbarHeight: 340,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 33),
          child: Column(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    height: 225,
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
                    padding:
                        const EdgeInsets.only(left: 20, top: 40, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Portfolio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            onTap: () async {
                              final action =
                                  await Dialogs.yesAbortDialog(context);
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 135, 20, 0),
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: customColors.mainBoxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: customColors.shadowColor,
                            blurRadius: 7,
                            spreadRadius: 0,
                            offset: Offset(3, 4),
                          ),
                        ],
                      ),
                      child: AssetChart(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Column(
              children: [
                AssetCard(
                  color: Colors.lightGreenAccent,
                  assetName: 'ETFs',
                  amount: 1315223,
                  percentage: 100,
                ),
                AssetCard(
                  color: Colors.redAccent,
                  assetName: 'Stocks',
                  amount: 1315223,
                  percentage: 100,
                ),
                AssetCard(
                  color: Colors.blueAccent,
                  assetName: 'Crypto',
                  amount: 1315223,
                  percentage: 100,
                ),
                AssetCard(
                  color: Colors.tealAccent,
                  assetName: 'Real Estate',
                  amount: 1315223,
                  percentage: 100,
                ),
                AssetCard(
                  color: Colors.purpleAccent,
                  assetName: 'Bonds',
                  amount: 1315223,
                  percentage: 100,
                ),
                AssetCard(
                  color: Colors.yellowAccent,
                  assetName: 'Recourse\'s',
                  amount: 1315223,
                  percentage: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
