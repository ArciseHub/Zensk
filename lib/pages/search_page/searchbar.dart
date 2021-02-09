import 'package:flutter/material.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

//https://pub.dev/packages/material_floating_search_bar

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  final customColors = CustomColors();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.headlineBoxColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FloatingSearchBar(
              leadingActions: [
                Icon(Icons.search),
              ],
              hint: 'Stocks, Crypto, ETFs...',
              hintStyle: TextStyle(
                color: customColors.headlineBoxColor,
                fontSize: 22.5,
                fontWeight: FontWeight.normal,
              ),
              iconColor: customColors.headlineBoxColor,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.search,
              borderRadius: BorderRadius.circular(60),
              openAxisAlignment: 0.0,
              maxWidth: 500,
              axisAlignment: 0.0,
              scrollPadding: EdgeInsets.only(top: 16, bottom: 24),
              elevation: 0,
              backdropColor: Colors.transparent,
              queryStyle: TextStyle(
                color: customColors.headlineBoxColor,
                fontSize: 22.5,
                fontWeight: FontWeight.normal,
                letterSpacing: 0,
              ),
              clearQueryOnClose: true,
              progress: false,
              onQueryChanged: (query) {},
              transitionCurve: Curves.easeInOut,
              transitionDuration: Duration(milliseconds: 500),
              transition: CircularFloatingSearchBarTransition(),
              debounceDelay: Duration(milliseconds: 500),
              autocorrect: false,
              actions: [
                FloatingSearchBarAction.back(
                  color: customColors.headlineBoxColor,
                ),
              ],
              builder: (context, transition) {
                return ClipRRect(
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7.5),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'Stocks',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27.5,
                                  ),
                                ),
                                subtitle: Text(
                                  'more info here....',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
