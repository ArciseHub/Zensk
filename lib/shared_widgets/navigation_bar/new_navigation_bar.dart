import 'package:flutter/material.dart';
import 'package:informatik_projekt/pages/dashboard_page/dashboard_page.dart';
import 'package:informatik_projekt/pages/news_page/news_page.dart';
import 'package:informatik_projekt/pages/portfolio_page/portfolio_page.dart';
import 'package:informatik_projekt/pages/search_page/search_page.dart';
import 'package:informatik_projekt/pages/search_page/searchbar.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

//https://www.youtube.com/watch?v=qj7jcuU2Z10&list=LL&index=2&t=177s

class NewNavigationBar extends StatefulWidget {
  @override
  _NewNavigationBarState createState() => _NewNavigationBarState();
}

class _NewNavigationBarState extends State<NewNavigationBar> {
  final customColors = CustomColors();
  String _currentPage = "Dashboard";
  List<String> pageKeys = [
    "Dashboard",
    "Portfolio",
    "Search",
    "News",
    "Account"
  ];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Dashboard": GlobalKey<NavigatorState>(),
    "Portfolio": GlobalKey<NavigatorState>(),
    "Search": GlobalKey<NavigatorState>(),
    "News": GlobalKey<NavigatorState>(),
    "Account": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;
  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Dashboard") {
            _selectTab("Dashboard", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: [
          _buildOffstageNavigator("Dashboard"),
          _buildOffstageNavigator("Portfolio"),
          _buildOffstageNavigator("Search"),
          _buildOffstageNavigator("News"),
          _buildOffstageNavigator("Account"),
        ]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: customColors.headlineBoxColor,
                blurRadius: 14.5,
                spreadRadius: 0,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: BottomNavigationBar(
            onTap: (int index) {
              _selectTab(pageKeys[index], index);
            },
            currentIndex: _selectedIndex,
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
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: customColors.navigationBarSelectedItemColor,
            unselectedItemColor: customColors.navigationBarUnselectedItemColor,
            iconSize: 30.0,
            backgroundColor: customColors.backgroundColor,
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator({Key key, this.navigatorKey, this.tabItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "Dashboard")
      child = DashboardPage();
    else if (tabItem == "Portfolio")
      child = PortfolioPage();
    else if (tabItem == "Search")
      child = SearchPage();
    else if (tabItem == "News")
      child = NewsPage();
    else if (tabItem == "Account") child = SearchBar();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
