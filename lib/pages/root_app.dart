import 'package:budget_tracker_ui/pages/budget_page.dart';
import 'package:budget_tracker_ui/pages/create_budge_page.dart';
import 'package:budget_tracker_ui/pages/daily_page.dart';
import 'package:budget_tracker_ui/pages/profile_page.dart';
import 'package:budget_tracker_ui/pages/stats_page.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setTabs(4),
        child: Icon(Icons.add, size: 25),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DailyPage(),
        StatsPage(),
        BudgetPage(),
        ProfilePage(),
        CreatBudgetPage(),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.ios_person,
    ];
    return AnimatedBottomNavigationBar(
      icons: iconItems,
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: black.withOpacity(0.5),
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) => setTabs(index),
    );
  }

  setTabs(index) => setState(() => pageIndex = index);
}
