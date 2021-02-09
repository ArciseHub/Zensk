import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/account_page/account_page.dart';
import 'package:informatik_projekt/pages/dashboard_page/dashboard_page.dart';
import 'package:informatik_projekt/pages/news_page/news_page.dart';
import 'package:informatik_projekt/pages/portfolio_page/portfolio_page.dart';
import 'package:informatik_projekt/pages/search_page/search_page.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key key}) : super(key: key);
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedItem = 0;
  var _pages = [
    DashboardPage(),
    PortfolioPage(),
    SearchPage(),
    NewsPage(),
    AccountPage(),
  ];
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        iconSize: 30.0,
        backgroundColor: Color.fromRGBO(20, 20, 20, 1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.sort),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.style),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
            _pageController.animateToPage(_selectedItem,
                duration: Duration(milliseconds: 10), curve: Curves.linear);
          });
        },
      ),
    );
  }
}
