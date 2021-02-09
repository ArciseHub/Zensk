import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/performance.dart';
import 'package:informatik_projekt/utilities/theme/themes.dart';

class NavigationOfWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themes(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => DefaultTextStyle(
        style: themes().textTheme.bodyText1,
        child: Performance(),
      ),
    );
  }
}
