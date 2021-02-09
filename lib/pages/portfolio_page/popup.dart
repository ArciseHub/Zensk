import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/portfolio_page/popup_selecter.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

enum DialogAction { yes, abort }
final customColors = CustomColors();

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: constantMainBoxColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            'Add Assets',
            style: TextStyle(
              color: constantNavigationBarSelectedItemColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Container(
            height: 500,
            width: 450,
            child: ListView(
              children: [
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Asset',
                          style: TextStyle(color: Colors.white30, fontSize: 15),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              PopUpSelecter(text: 'Stocks'),
                              PopUpSelecter(text: 'Crypto'),
                              PopUpSelecter(text: 'ETFs'),
                              PopUpSelecter(text: 'Fonds'),
                              PopUpSelecter(text: 'Bonds'),
                              PopUpSelecter(text: 'Recourse\'s'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Details',
                            style:
                                TextStyle(color: Colors.white30, fontSize: 15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10, left: 0),
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: constantBackgroundColor,
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
                                    'Amount',
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10, right: 0),
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: constantBackgroundColor,
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
                                    'Price',
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 0, right: 0),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: constantHeadlineBoxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: customColors.shadowColorLight,
                            blurRadius: 5,
                            spreadRadius: 0,
                            offset: Offset(3, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Date and Time',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Broker',
                            style:
                                TextStyle(color: Colors.white30, fontSize: 15),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                PopUpSelecter(text: 'Trade Republic'),
                                PopUpSelecter(text: 'Scalable Capital'),
                                PopUpSelecter(text: 'Consorsbank'),
                                PopUpSelecter(text: 'Comdirekt'),
                                PopUpSelecter(text: 'Smartbroker'),
                                PopUpSelecter(text: 'Else'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trading Place',
                            style:
                                TextStyle(color: Colors.white30, fontSize: 15),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                PopUpSelecter(text: 'Gettex'),
                                PopUpSelecter(text: 'LSX'),
                                PopUpSelecter(text: 'Tradegate'),
                                PopUpSelecter(text: 'Stuttgart'),
                                PopUpSelecter(text: 'Berlin'),
                                PopUpSelecter(text: 'Munich'),
                                PopUpSelecter(text: 'NYSE'),
                                PopUpSelecter(text: 'Else'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.abort),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: constantNavigationBarUnselectedItemColor,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.yes),
              color: constantHeadlineBoxColor,
              child: const Text(
                'Add',
                style: TextStyle(
                  color: constantNavigationBarSelectedItemColor,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}
