import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/bottom_navigator.dart';
import 'package:nepal_covid_19_tracker/dashboard/provider/dashboard_provider.dart';
import 'package:nepal_covid_19_tracker/faq/faq_provider.dart';
import 'package:nepal_covid_19_tracker/myths/myth_provider.dart';
import 'package:nepal_covid_19_tracker/hospitals/hospital_provider.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:route_transitions/route_transitions.dart';

import 'news/news_provider.dart';
import 'resources/resources_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _pageRoute();
    super.initState();
  }

  _pageRoute() {
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          PageRouteTransition(
            animationType: AnimationType.fade,
            builder: (context) => BottomNavagation(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DashboardProvider>(context);
    Provider.of<NewsProvider>(context);
    Provider.of<HospitalProvider>(context);
    Provider.of<MythProvider>(context);
    Provider.of<FAQProvider>(context);
    Provider.of<RecourceProvider>(context);
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: PRIMARY_COLOR,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          Column(
            children: [
              Image.asset(
                'assets/images/covid.png',
                width: width / 3,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Nepal COVID-19 Tracker',
                style: TextStyle(
                  color: WHITE,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              // Text(
              //   'Copyright © '
              //   '${DateTime.now().year}'
              //   ' Alok Mishra',
              //   softWrap: true,
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontWeight: FontWeight.w400,
              //     fontSize: 10,
              //     color: WHITE,
              //   ),
              // ),
              const Text(
                'Version 1.0.0',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: WHITE,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
