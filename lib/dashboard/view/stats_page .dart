import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/dashboard/provider/dashboard_provider.dart';
import 'package:nepal_covid_19_tracker/faq/faq_item_view.dart';
import 'package:nepal_covid_19_tracker/faq/faq_list.dart';
import 'package:nepal_covid_19_tracker/faq/faq_provider.dart';
import 'package:nepal_covid_19_tracker/myths/myth_item_view.dart';
import 'package:nepal_covid_19_tracker/myths/myth_list.dart';
import 'package:nepal_covid_19_tracker/myths/myth_provider.dart';
import 'package:nepal_covid_19_tracker/news/news_item_view.dart';
import 'package:nepal_covid_19_tracker/news/news_list.dart';
import 'package:nepal_covid_19_tracker/news/news_provider.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:nepal_covid_19_tracker/utils/date_time_parser.dart';
import 'package:provider/provider.dart';
import 'package:route_transitions/route_transitions.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  _refreshPage(
    DashboardProvider d,
    NewsProvider n,
    MythProvider m,
    FAQProvider f,
  ) async {
    await d.getWorldSummery();
    await d.getNepalSummery();
    await d.getWorldCountry();
    await n.initNews();
    await m.initMyths();
    await f.initMyths();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final dashProvider = Provider.of<DashboardProvider>(context);
    final newsProvider = Provider.of<NewsProvider>(context);
    final mythProvider = Provider.of<MythProvider>(context);
    final faqProvider = Provider.of<FAQProvider>(context);
    final nepalInfo = dashProvider.worldByCountry.stats
        .where((e) => e.countryCode == 'NP')
        .first;
    var updateTime =
        DateTime.fromMillisecondsSinceEpoch(dashProvider.worldSummery.updated);
    return Material(
      color: PRIMARY_COLOR.withOpacity(0.1),
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _refreshPage(
            dashProvider,
            newsProvider,
            mythProvider,
            faqProvider,
          ),
          child: (dashProvider.worldByCountry != null &&
                  dashProvider.worldSummery != null &&
                  dashProvider.nepakSummery != null &&
                  newsProvider.news != null &&
                  mythProvider.myths != null &&
                  faqProvider.faqs != null)
              ? ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Material(
                          color: PRIMARY_COLOR.withOpacity(0.75),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/globe.png',
                                  height: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'World Summery',
                                  style: TextStyle(
                                    color: WHITE,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Latest Update ${timeDiffNowLocal(updateTime.toString())}',
                                style: TextStyle(
                                  color: STEXT,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text('',
                                style: TextStyle(
                                  color: STEXT,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: (width - 32) / 3,
                              child: Material(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cases',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Today ${dashProvider.worldSummery.todayCases}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Total ${dashProvider.worldSummery.cases}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (width - 32) / 3,
                              child: Material(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Deaths',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Today ${dashProvider.worldSummery.todayDeaths}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Total ${dashProvider.worldSummery.deaths}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (width - 32) / 3,
                              child: Material(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Recovery',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Today ${dashProvider.worldSummery.todayRecovered}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Total ${dashProvider.worldSummery.recovered}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Material(
                          color: PRIMARY_COLOR.withOpacity(0.75),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  nepalInfo.countryInfo.flag,
                                  height: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Nepal Summery',
                                  style: TextStyle(
                                    color: WHITE,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Latest Update ${timeDiffNow(nepalInfo.updated)}',
                                style: TextStyle(
                                  color: STEXT,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text('',
                                style: TextStyle(
                                  color: STEXT,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: (width - 32) / 3,
                              child: Material(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cases',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Today ${nepalInfo.newCases}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Total ${nepalInfo.totalCases}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (width - 32) / 3,
                              child: Material(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Deaths',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Today ${nepalInfo.newDeaths}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Total ${nepalInfo.totalDeaths}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (width - 32) / 3,
                              child: Material(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Recovered ${nepalInfo.totalRecovered}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Active ${nepalInfo.activeCases}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Tests ${nepalInfo.tests}',
                                        style: TextStyle(
                                          color: WHITE,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Latest Update ${timeDiffNow(dashProvider.nepakSummery.latestSitReport.updatedAt)}',
                                style: TextStyle(
                                  color: STEXT,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text('Source MOHP SIT',
                                style: TextStyle(
                                  color: STEXT,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: (width - 24) / 2,
                              child: Material(
                                color: WHITE,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Positive',
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            dashProvider
                                                .nepakSummery.testedPositive
                                                .toString(),
                                            style: TextStyle(
                                              color: STEXT,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Negative',
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            dashProvider
                                                .nepakSummery.testedNegative
                                                .toString(),
                                            style: TextStyle(
                                              color: STEXT,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Pending',
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            dashProvider
                                                .nepakSummery.pendingResult
                                                .toString(),
                                            style: TextStyle(
                                              color: STEXT,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'RDT Tests',
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            dashProvider.nepakSummery.testedRdt
                                                .toString(),
                                            style: TextStyle(
                                              color: STEXT,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total Tests',
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            dashProvider
                                                .nepakSummery.testedTotal
                                                .toString(),
                                            style: TextStyle(
                                              color: STEXT,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (width - 24) / 2,
                              child: Material(
                                color: WHITE,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Deaths',
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            dashProvider.nepakSummery.deaths
                                                .toString(),
                                            style: TextStyle(
                                              color: STEXT,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Recovered',
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            dashProvider.nepakSummery.recovered
                                                .toString(),
                                            style: TextStyle(
                                              color: STEXT,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Quarantined',
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            dashProvider
                                                .nepakSummery.quarantined
                                                .toString(),
                                            style: TextStyle(
                                              color: STEXT,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Isolation',
                                            style: TextStyle(
                                              color: PRIMARY_COLOR,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            dashProvider
                                                .nepakSummery.inIsolation
                                                .toString(),
                                            style: TextStyle(
                                              color: STEXT,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Material(
                          color: PRIMARY_COLOR.withOpacity(0.75),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  ' Country Ranking ',
                                  style: TextStyle(
                                    color: WHITE,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              dashProvider.worldByCountry.stats.length > 10
                                  ? 10
                                  : dashProvider.worldByCountry.stats.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 4.0,
                            );
                          },
                          itemBuilder: (context, index) {
                            return Material(
                              color: WHITE,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              child: ListTile(
                                isThreeLine: true,
                                dense: true,
                                leading: CachedNetworkImage(
                                  imageUrl: dashProvider.worldByCountry
                                      .stats[index + 2].countryInfo.flag,
                                  width: 28,
                                  height: 28,
                                ),
                                title: Text(
                                  dashProvider
                                      .worldByCountry.stats[index + 2].country,
                                  style: TextStyle(
                                    color: PRIMARY_COLOR,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  'Cases ${dashProvider.worldByCountry.stats[index + 2].totalCases} '
                                  '(Today ${dashProvider.worldByCountry.stats[index + 2].newCases})\n'
                                  'Deaths ${dashProvider.worldByCountry.stats[index + 2].totalDeaths} '
                                  '(Today ${dashProvider.worldByCountry.stats[index + 2].newDeaths})',
                                  style: TextStyle(
                                    color: STEXT,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              color: PRIMARY_COLOR.withOpacity(0.75),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ' News ',
                                  style: TextStyle(
                                    color: WHITE,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteTransition(
                                      animationType: AnimationType.fade,
                                      builder: (context) => NewsListView(),
                                    ),
                                  );
                                },
                                child: Text(
                                  ' View All ',
                                  style: TextStyle(
                                    color: PRIMARY_COLOR,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                color: WHITE,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  side: BorderSide(
                                    color: PRIMARY_COLOR.withOpacity(0.75),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: newsProvider.news.data.length > 3
                              ? 3
                              : newsProvider.news.data.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 4.0,
                            );
                          },
                          itemBuilder: (context, index) {
                            return NewsItemView(
                              data: newsProvider.news.data[index],
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              color: PRIMARY_COLOR.withOpacity(0.75),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ' Myths ',
                                  style: TextStyle(
                                    color: WHITE,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteTransition(
                                      animationType: AnimationType.fade,
                                      builder: (context) => MythListView(),
                                    ),
                                  );
                                },
                                child: Text(
                                  ' View All ',
                                  style: TextStyle(
                                    color: PRIMARY_COLOR,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                color: WHITE,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  side: BorderSide(
                                    color: PRIMARY_COLOR.withOpacity(0.75),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: mythProvider.myths.data.length > 3
                              ? 3
                              : newsProvider.news.data.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 4.0,
                            );
                          },
                          itemBuilder: (context, index) {
                            return MythItemView(
                              data: mythProvider.myths.data[index],
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              color: PRIMARY_COLOR.withOpacity(0.75),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ' FAQs ',
                                  style: TextStyle(
                                    color: WHITE,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteTransition(
                                      animationType: AnimationType.fade,
                                      builder: (context) => FAQListView(),
                                    ),
                                  );
                                },
                                child: Text(
                                  ' View All ',
                                  style: TextStyle(
                                    color: PRIMARY_COLOR,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                color: WHITE,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  side: BorderSide(
                                    color: PRIMARY_COLOR.withOpacity(0.75),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: faqProvider.faqs.data.length > 3
                              ? 3
                              : newsProvider.news.data.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 4.0,
                            );
                          },
                          itemBuilder: (context, index) {
                            return FAQItemView(
                              data: faqProvider.faqs.data[index],
                            );
                          },
                        ),
                        SizedBox(height: 60),
                      ],
                    )
                  ],
                )
              : Center(
                  child: FlatButton(
                    onPressed: () => _refreshPage(
                      dashProvider,
                      newsProvider,
                      mythProvider,
                      faqProvider,
                    ),
                    color: PRIMARY_COLOR,
                    child: Text(
                      'Reload',
                      style: TextStyle(
                        color: WHITE,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
