import 'package:flutter/material.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class CurrencyChanger extends StatelessWidget {
  CurrencyChanger({@required this.currency, @required this.amount});
  final String currency;
  final double amount;
  @override
  final customColors = CustomColors();
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 65,
            width: 140,
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
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.5),
                    child: Text(
                      currency,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 15.75,
                      ),
                    ),
                  ),
                  Text(
                    amount.toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
