import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:informatik_projekt/pages/FirstPages/FirstPage.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:informatik_projekt/utilities/theme/TextStyle.dart';

//https://www.youtube.com/watch?v=8eRQyE2PN7w&t=1s

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 5;
  final customColors = CustomColors();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 1.5.w),
      height: 1.75.w,
      width: isActive ? 5.5.w : 3.5.w,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : customColors.headlineBoxColor,
          borderRadius: BorderRadius.all(Radius.circular(3)),
          boxShadow: [
            BoxShadow(
              color: isActive ? Colors.white38 : customColors.shadowColor,
              blurRadius: 0.05.w,
              spreadRadius: 0,
              offset: Offset(0.25.w, 0.45.w),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            color: customColors.backgroundColor,
            //gradient: LinearGradient(
            //begin: Alignment.topCenter,
            //end: Alignment.bottomCenter,
            //stops: [0.1, 0.4, 0.7, 0.9],
            //colors: [
            //Color(0xFF3594DD),
            //Color(0xFF4563DB),
            //Color(0xFF5036D5),
            //Color(0xFF5B16D0),
            //],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      //TODO : When it is on the final slide, it shouldn't be able to be on pressed and navigated to login screen
                      setState(() {
                        _currentPage == _numPages - 1
                            ? Text('')
                            : Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FirstPage(),
                                    inheritTheme: true,
                                    ctx: context),
                              );
                      });
                    },
                    child: Text(
                      _currentPage == _numPages - 1 ? '' : 'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0.sp,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 69.25.h,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(7.5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/database.png',
                                ),
                                height: 35.0.h,
                                width: 100.0.w,
                              ),
                            ),
                            SizedBox(height: 3.5.h),
                            Text(
                              'Connect people\naround the world',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 1.75.h),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/dashboard.png',
                                ),
                                height: 35.0.h,
                                width: 100.0.w,
                              ),
                            ),
                            SizedBox(height: 3.5.h),
                            Text(
                              'Connect people\naround the world',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 1.75.h),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/portfolio.png',
                                ),
                                height: 35.0.h,
                                width: 100.0.w,
                              ),
                            ),
                            SizedBox(height: 3.5.h),
                            Text(
                              'Live your life smarter\nwith us!',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 1.75.h),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/search.png',
                                ),
                                height: 35.0.h,
                                width: 100.0.w,
                              ),
                            ),
                            SizedBox(height: 3.5.h),
                            Text(
                              'Get a new experience\nof imagination',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 1.75.h),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/news.png',
                                ),
                                height: 35.0.h,
                                width: 100.0.w,
                              ),
                            ),
                            SizedBox(height: 3.5.h),
                            Text(
                              'Get a new experience\nof imagination',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 1.75.h),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 950),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  _currentPage == _numPages - 1
                                      ? 'Get Started'
                                      : 'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0.sp,
                                  ),
                                ),
                                SizedBox(width: 1.0.w),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                  size: 3.5.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 6.0.h),
                  child: Container(
                    height: 7.0.h,
                    width: 57.5.w,
                    decoration: BoxDecoration(
                        color: customColors.headlineBoxColor,
                        borderRadius: BorderRadius.circular(22.5),
                        boxShadow: [
                          BoxShadow(
                            color: customColors.shadowColor,
                            blurRadius: 0.05.w,
                            spreadRadius: 0,
                            offset: Offset(0.5625.w, 1.125.w),
                          ),
                        ]),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirstPage()));
                      },
                      child: Center(
                        child: Text(
                          'Get started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Text(''),
    );
  }
}
