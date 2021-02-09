import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class AssetCard extends StatelessWidget {
  AssetCard(
      {@required this.color,
      @required this.assetName,
      @required this.amount,
      @required this.percentage});
  final Color color;
  final String assetName;
  final double amount;
  final double percentage;
  final customColors = CustomColors();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: customColors.mainBoxColor,
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
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14,
                  width: 4,
                  color: color,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        assetName,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 17.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  amount.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, top: 31),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  percentage.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white30,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
