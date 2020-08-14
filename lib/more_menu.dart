import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/apout_app.dart';
import 'package:nepal_covid_19_tracker/dashboard/view/country_list.dart';
import 'package:nepal_covid_19_tracker/faq/faq_list.dart';
import 'package:nepal_covid_19_tracker/myths/myth_list.dart';
import 'package:nepal_covid_19_tracker/resources/resources_list.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:route_transitions/route_transitions.dart';

import 'details/view/details_page .dart';
import 'news/news_list.dart';

class MoreMenu extends StatelessWidget {
  const MoreMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: PRIMARY_COLOR.withOpacity(0.1),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 8.0,
              ),
              Material(
                color: WHITE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteTransition(
                        animationType: AnimationType.fade,
                        builder: (context) => CountryListView(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      'COVID-19 Stats (By Country)',
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Material(
                color: WHITE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteTransition(
                        animationType: AnimationType.fade,
                        builder: (context) => DetailsPage(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      'Nepal COVID-19 Stats (By District)',
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 8.0,
              // ),
              // Material(
              //   color: WHITE,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(5.0),
              //     ),
              //   ),
              //   child: InkWell(
              //     onTap: () {},
              //     child: ListTile(
              //       title: Text(
              //         'Nepal COVID-19 Stats (By Municipality)',
              //         style: TextStyle(
              //           color: PRIMARY_COLOR,
              //           fontSize: 16,
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 8.0,
              ),
              Material(
                color: WHITE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteTransition(
                        animationType: AnimationType.fade,
                        builder: (context) => ResourcesListView(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      'Nepal Health Resources',
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Material(
                color: WHITE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteTransition(
                        animationType: AnimationType.fade,
                        builder: (context) => NewsListView(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      'COVID-19 News',
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Material(
                color: WHITE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteTransition(
                        animationType: AnimationType.fade,
                        builder: (context) => MythListView(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      'COVID-19 Myths',
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Material(
                color: WHITE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteTransition(
                        animationType: AnimationType.fade,
                        builder: (context) => FAQListView(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "COVID-19 FAQ's",
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Material(
                color: WHITE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteTransition(
                        animationType: AnimationType.fade,
                        builder: (context) => AboutAppPage(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      'About Application',
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
