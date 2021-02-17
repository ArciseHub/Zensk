import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/pages/MainPages/Account/account.dart';
import 'file:///C:/Users/Samuel/AndroidStudioProjects/informatik_projekt/lib/ui/pages/MainPages/Dashboard/dashboard.dart';
import 'file:///C:/Users/Samuel/AndroidStudioProjects/informatik_projekt/lib/ui/pages/MainPages/News/news.dart';
import 'file:///C:/Users/Samuel/AndroidStudioProjects/informatik_projekt/lib/ui/pages/MainPages/Portfolio/portfolio.dart';
import 'file:///C:/Users/Samuel/AndroidStudioProjects/informatik_projekt/lib/ui/pages/MainPages/Search/search.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:informatik_projekt/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

//https://www.youtube.com/watch?v=qj7jcuU2Z10&list=LL&index=2&t=177s

class NewNewNavigationBar extends StatefulWidget {
  @override
  _NewNewNavigationBarState createState() => _NewNewNavigationBarState();
}

class _NewNewNavigationBarState extends State<NewNewNavigationBar> {
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
    if (tabItem == "Dashboard") {
      child = Dashboard();
    } else if (tabItem == "Portfolio") {
      child = Portfolio();
    } else if (tabItem == "Search") {
      child = Search();
    } else if (tabItem == "News") {
      child = ChangeNotifierProvider(
          create: (_) => NewsArticleListViewModel(), child: News());
    } else if (tabItem == "Account") {
      child = Account();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
