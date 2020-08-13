import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepal_covid_19_tracker/dashboard/provider/dashboard_provider.dart';
import 'package:nepal_covid_19_tracker/dashboard/provider/stats_provider.dart';
import 'package:nepal_covid_19_tracker/faq/faq_provider.dart';
import 'package:nepal_covid_19_tracker/myths/myth_provider.dart';
import 'package:nepal_covid_19_tracker/hospitals/hospital_provider.dart';
import 'package:nepal_covid_19_tracker/splash_page.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';

import 'news/news_provider.dart';
import 'resources/resources_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: PRIMARY_COLOR,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StatsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HospitalProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MythProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FAQProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RecourceProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Nepal COVID-19 Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.workSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: SplashPage(),
      ),
    );
  }
}
