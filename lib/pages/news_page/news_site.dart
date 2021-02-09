import 'package:flutter/material.dart';

class NewsSite extends StatefulWidget {
  @override
  _NewsSiteState createState() => _NewsSiteState();
}

class _NewsSiteState extends State<NewsSite> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              height: screenSize.height,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 35, 0, 0),
                    child: Text(
                      'News Title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 15, 0, 0),
                    child: Text(
                      'News Text',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
