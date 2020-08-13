import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/dashboard/model/nepal_timeline_model.dart';
import 'package:nepal_covid_19_tracker/dashboard/provider/stats_provider.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  _refreshPage(StatsProvider s) async {
    await s.getNepalTimeline();
  }

  @override
  Widget build(BuildContext context) {
    final statsProvider = Provider.of<StatsProvider>(context);
    final List<Timelines> timelineBars = List<Timelines>();
    final List<Timelines> timeline = List<Timelines>();
    if (statsProvider.timeline != null) {
      var t = statsProvider.timeline.timelines;
      for (int i = t.length - 8; i < t.length; i++) {
        timeline.add(t[i]);
      }
      for (int i = t.length - 16; i < t.length; i++) {
        timelineBars.add(t[i]);
      }
    }
    return Material(
      color: PRIMARY_COLOR.withOpacity(0.1),
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _refreshPage(statsProvider),
          child: (statsProvider.timeline != null)
              ? ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  children: [
                    SizedBox(
                      height: 16.0,
                    ),
                    Material(
                      color: WHITE,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Total COVID-19 Cases In Nepal (Last 7 Days)',
                              style: TextStyle(
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: LineChart(
                                LineChartData(
                                  minY:
                                      (timeline[0].totalCases - 250).toDouble(),
                                  maxY: (timeline.last.totalCases + 250)
                                      .toDouble(),
                                  //minX: (-0.5).toDouble(),
                                  //maxX: (timeline.length - 0.5).toDouble(),
                                  lineTouchData: LineTouchData(enabled: true),
                                  gridData: FlGridData(
                                    show: false,
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: [
                                        for (int i = 0;
                                            i < timeline.length;
                                            i++)
                                          FlSpot(
                                            i.toDouble(),
                                            timeline[i].totalCases.toDouble(),
                                          ),
                                      ],
                                      isCurved: true,
                                      barWidth: 2,
                                      preventCurveOverShooting: true,
                                      show: true,
                                      colors: [
                                        PRIMARY_COLOR,
                                      ],
                                      dotData: FlDotData(
                                        show: true,
                                      ),
                                    ),
                                  ],
                                  titlesData: FlTitlesData(
                                    bottomTitles: SideTitles(
                                        showTitles: true,
                                        textStyle: TextStyle(
                                          fontSize: 10,
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        rotateAngle: 90,
                                        getTitles: (value) {
                                          return timeline[(value).floor()]
                                              .date
                                              .substring(
                                                5,
                                              );
                                        }),
                                    leftTitles: SideTitles(
                                      showTitles: false,
                                      interval: 500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Material(
                      color: WHITE,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Daily COVID-19 Cases In Nepal (Last 30 Days)',
                              style: TextStyle(
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceBetween,
                                  minY: 0,
                                  groupsSpace: 4,
                                  barTouchData: BarTouchData(
                                    enabled: true,
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    bottomTitles: SideTitles(
                                      showTitles: true,
                                      textStyle: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      margin: 10,
                                      rotateAngle: 90,
                                      getTitles: (double value) {
                                        return timelineBars[value.floor()]
                                            .date
                                            .substring(5);
                                      },
                                    ),
                                    leftTitles: SideTitles(
                                      showTitles: false,
                                    ),
                                  ),
                                  barGroups: [
                                    for (int i = 0;
                                        i < timelineBars.length;
                                        i++)
                                      BarChartGroupData(
                                        x: 0,
                                        barRods: [
                                          BarChartRodData(
                                            y: timelineBars[i]
                                                .newCases
                                                .toDouble(),
                                            width: 14,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(2),
                                              topRight: Radius.circular(2),
                                            ),
                                            rodStackItems: [
                                              BarChartRodStackItem(
                                                0,
                                                timelineBars[i]
                                                    .newCases
                                                    .toDouble(),
                                                PRIMARY_COLOR,
                                              ),
                                              // BarChartRodStackItem(
                                              //   0,
                                              //   timelineBars[i]
                                              //       .newRecoveries
                                              //       .toDouble(),
                                              //   Colors.green,
                                              // ),
                                              // BarChartRodStackItem(
                                              //   0,
                                              //   timelineBars[i]
                                              //       .newDeaths
                                              //       .toDouble(),
                                              //   Colors.red,
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Material(
                      color: WHITE,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Total COVID-19 Deaths In Nepal (Last 7 Days)',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: LineChart(
                                LineChartData(
                                  minY:
                                      (timeline[0].totalDeaths - 5).toDouble(),
                                  maxY: (timeline.last.totalDeaths + 5)
                                      .toDouble(),
                                  //minX: (-0.5).toDouble(),
                                  //maxX: (timeline.length - 0.5).toDouble(),
                                  lineTouchData: LineTouchData(enabled: true),
                                  gridData: FlGridData(
                                    show: false,
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: [
                                        for (int i = 0;
                                            i < timeline.length;
                                            i++)
                                          FlSpot(
                                            i.toDouble(),
                                            timeline[i].totalDeaths.toDouble(),
                                          ),
                                      ],
                                      isCurved: true,
                                      barWidth: 2,
                                      preventCurveOverShooting: true,
                                      show: true,
                                      colors: [
                                        Colors.red,
                                      ],
                                      dotData: FlDotData(
                                        show: true,
                                      ),
                                    ),
                                  ],
                                  titlesData: FlTitlesData(
                                    bottomTitles: SideTitles(
                                      showTitles: true,
                                      textStyle: TextStyle(
                                        fontSize: 10,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      rotateAngle: 90,
                                      getTitles: (value) {
                                        return timeline[(value).floor()]
                                            .date
                                            .substring(
                                              5,
                                            );
                                      },
                                    ),
                                    leftTitles: SideTitles(
                                      showTitles: false,
                                      interval: 5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Material(
                      color: WHITE,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Daily COVID-19 Death In Nepal (Last 30 Days)',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceBetween,
                                  minY: 0,
                                  groupsSpace: 4,
                                  barTouchData: BarTouchData(
                                    enabled: true,
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    bottomTitles: SideTitles(
                                      showTitles: true,
                                      textStyle: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      margin: 10,
                                      rotateAngle: 90,
                                      getTitles: (double value) {
                                        return timelineBars[value.floor()]
                                            .date
                                            .substring(5);
                                      },
                                    ),
                                    leftTitles: SideTitles(
                                      showTitles: false,
                                    ),
                                  ),
                                  barGroups: [
                                    for (int i = 0;
                                        i < timelineBars.length;
                                        i++)
                                      BarChartGroupData(
                                        x: 0,
                                        barRods: [
                                          BarChartRodData(
                                            y: timelineBars[i]
                                                .newDeaths
                                                .toDouble(),
                                            width: 14,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(2),
                                              topRight: Radius.circular(2),
                                            ),
                                            rodStackItems: [
                                              BarChartRodStackItem(
                                                0,
                                                timelineBars[i]
                                                    .newDeaths
                                                    .toDouble(),
                                                Colors.red,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Material(
                      color: WHITE,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Total COVID-19 Recoveries In Nepal (Last 7 Days)',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: LineChart(
                                LineChartData(
                                  minY: (timeline[0].totalRecoveries - 250)
                                      .toDouble(),
                                  maxY: (timeline.last.totalRecoveries + 250)
                                      .toDouble(),
                                  //minX: (-0.5).toDouble(),
                                  //maxX: (timeline.length - 0.5).toDouble(),
                                  gridData: FlGridData(
                                    show: false,
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  lineTouchData: LineTouchData(enabled: true),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: [
                                        for (int i = 0;
                                            i < timeline.length;
                                            i++)
                                          FlSpot(
                                            i.toDouble(),
                                            timeline[i]
                                                .totalRecoveries
                                                .toDouble(),
                                          ),
                                      ],
                                      isCurved: true,
                                      barWidth: 2,
                                      preventCurveOverShooting: true,
                                      show: true,
                                      colors: [Colors.green],
                                      dotData: FlDotData(
                                        show: true,
                                      ),
                                    ),
                                  ],
                                  titlesData: FlTitlesData(
                                    bottomTitles: SideTitles(
                                        showTitles: true,
                                        rotateAngle: 90,
                                        textStyle: TextStyle(
                                          fontSize: 10,
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        getTitles: (value) {
                                          return timeline[(value).floor()]
                                              .date
                                              .substring(
                                                5,
                                              );
                                        }),
                                    leftTitles: SideTitles(
                                      showTitles: false,
                                      interval: 250,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Material(
                      color: WHITE,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Daily COVID-19 Recoveries In Nepal (Last 30 Days)',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceBetween,
                                  minY: 0,
                                  groupsSpace: 4,
                                  barTouchData: BarTouchData(
                                    enabled: true,
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    bottomTitles: SideTitles(
                                      showTitles: true,
                                      textStyle: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      margin: 10,
                                      rotateAngle: 90,
                                      getTitles: (double value) {
                                        return timelineBars[value.floor()]
                                            .date
                                            .substring(5);
                                      },
                                    ),
                                    leftTitles: SideTitles(
                                      showTitles: false,
                                    ),
                                  ),
                                  barGroups: [
                                    for (int i = 0;
                                        i < timelineBars.length;
                                        i++)
                                      BarChartGroupData(
                                        x: 0,
                                        barRods: [
                                          BarChartRodData(
                                            y: timelineBars[i]
                                                .newRecoveries
                                                .toDouble(),
                                            width: 14,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(2),
                                              topRight: Radius.circular(2),
                                            ),
                                            rodStackItems: [
                                              BarChartRodStackItem(
                                                0,
                                                timelineBars[i]
                                                    .newRecoveries
                                                    .toDouble(),
                                                Colors.green,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                )
              : Center(
                  child: FlatButton(
                    onPressed: () => _refreshPage(statsProvider),
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
