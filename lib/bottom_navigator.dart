import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nepal_covid_19_tracker/dashboard/view/dashboard_page.dart';
import 'package:nepal_covid_19_tracker/dashboard/view/stats_page%20.dart';
import 'package:nepal_covid_19_tracker/hospitals/hospital_list.dart';
import 'package:nepal_covid_19_tracker/more_menu.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavagation extends StatelessWidget {
  const BottomNavagation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: WHITE,
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR.withOpacity(0.25),
        body: PersistentTabView(
          screens: <Widget>[
            DashboardPage(),
            StatsPage(),
            HospitalListView(),
            MoreMenu(),
          ],
          items: _barItems,
          confineInSafeArea: true,
          backgroundColor: PRIMARY_COLOR,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          popAllScreensOnTapOfSelectedTab: true,
          iconSize: 18,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style14,
        ),
      ),
    );
  }
}

final List<PersistentBottomNavBarItem> _barItems = [
  PersistentBottomNavBarItem(
    icon: Icon(Ionicons.md_globe),
    title: ("Dashboard"),
    activeColor: SECONDARY_COLOR,
    inactiveColor: WHITE,
  ),
  PersistentBottomNavBarItem(
    icon: Icon(Ionicons.md_stats),
    title: ("Statistics"),
    activeColor: SECONDARY_COLOR,
    inactiveColor: WHITE,
  ),
  PersistentBottomNavBarItem(
    icon: Icon(Ionicons.md_medical),
    title: ("Hospitals"),
    activeColor: SECONDARY_COLOR,
    inactiveColor: WHITE,
  ),
  PersistentBottomNavBarItem(
    icon: Icon(Ionicons.md_menu),
    title: ("More"),
    activeColor: SECONDARY_COLOR,
    inactiveColor: WHITE,
  ),
];
