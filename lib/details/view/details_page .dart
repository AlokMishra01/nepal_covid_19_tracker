import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/details/model/district_model.dart';
import 'package:nepal_covid_19_tracker/details/provider/details_provider.dart';
import 'package:nepal_covid_19_tracker/details/view/mun_page%20.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Districts _selectedDistrict;
  int _items = 10;

  _refreshPage(DetailsProvider d) async {
    _items = 10;
    await d.getDistricts();
    await d.getgetDistrictDetails(
      _selectedDistrict != null ? _selectedDistrict.id : 27,
    );
  }

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<DetailsProvider>(context);
    if (_selectedDistrict == null) {
      _selectedDistrict =
          detailsProvider.districts.districts.where((e) => e.id == 27).first;
    }
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: PRIMARY_COLOR.withOpacity(0.1),
          appBar: AppBar(
            backgroundColor: PRIMARY_COLOR,
            elevation: 0,
            title: Text('Districts Details'),
          ),
          body: RefreshIndicator(
            onRefresh: () => _refreshPage(detailsProvider),
            child: (detailsProvider.districts != null)
                ? NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification s) {
                      if (s.metrics.pixels == s.metrics.maxScrollExtent) {
                        if (detailsProvider.districtDetails.covidCases.length >
                            _items + 10)
                          setState(() {
                            _items = _items + 10;
                          });
                        else
                          setState(() {
                            _items = detailsProvider
                                .districtDetails.covidCases.length;
                          });
                        return true;
                      }
                      return false;
                    },
                    child: Column(
                      children: [
                        Material(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                DropdownButton(
                                  elevation: 0,
                                  isExpanded: true,
                                  underline: Container(),
                                  value: detailsProvider.districts.districts
                                      .where(
                                          (e) => e.id == _selectedDistrict.id)
                                      .first,
                                  hint: Text(
                                    'Select District',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  items: detailsProvider.districts != null
                                      ? detailsProvider.districts.districts
                                          .map(
                                            (value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(
                                                '${value.titleNe}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: PRIMARY_COLOR,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList()
                                      : [],
                                  onChanged: (v) {
                                    setState(() {
                                      _selectedDistrict = v;
                                      _items = 10;
                                      detailsProvider.getgetDistrictDetails(
                                        _selectedDistrict.id,
                                      );
                                    });

                                    print(v);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: detailsProvider.districtDetails != null
                              ? ListView(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  children: [
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    Row(
                                      children: [
                                        Material(
                                          color:
                                              PRIMARY_COLOR.withOpacity(0.75),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              ' Summery ',
                                              style: TextStyle(
                                                color: WHITE,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Text('')),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: (width - 32) / 4,
                                          child: Material(
                                            color: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Cases',
                                                    style: TextStyle(
                                                      color: WHITE,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${detailsProvider.districtDetails.covidSummary.cases}',
                                                    style: TextStyle(
                                                      color: WHITE,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: (width - 32) / 4,
                                          child: Material(
                                            color: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Deaths',
                                                    style: TextStyle(
                                                      color: WHITE,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${detailsProvider.districtDetails.covidSummary.death}',
                                                    style: TextStyle(
                                                      color: WHITE,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: (width - 32) / 4,
                                          child: Material(
                                            color: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Recovery',
                                                    style: TextStyle(
                                                      color: WHITE,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${detailsProvider.districtDetails.covidSummary.recovered}',
                                                    style: TextStyle(
                                                      color: WHITE,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: (width - 32) / 4,
                                          child: Material(
                                            color: Colors.amber,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Active',
                                                    style: TextStyle(
                                                      color: WHITE,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${detailsProvider.districtDetails.covidSummary.active}',
                                                    style: TextStyle(
                                                      color: WHITE,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                    Row(
                                      children: [
                                        Material(
                                          color:
                                              PRIMARY_COLOR.withOpacity(0.75),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              ' ${_selectedDistrict != null ? _selectedDistrict.titleNe : ''} Municipalities ',
                                              style: TextStyle(
                                                color: WHITE,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Text('')),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    SizedBox(
                                      height: 24,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: detailsProvider
                                            .districtDetails
                                            .municipalities
                                            .length,
                                        separatorBuilder: (context, index) {
                                          return SizedBox(height: 4);
                                        },
                                        itemBuilder: (context, index) {
                                          var c = detailsProvider
                                              .districtDetails
                                              .municipalities[index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0,
                                            ),
                                            child: SizedBox(
                                              height: 16,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteTransition(
                                                      animationType:
                                                          AnimationType.fade,
                                                      builder: (context) =>
                                                          MunDetailsPage(
                                                        municipalities: c,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Material(
                                                  color: Colors.purple,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        c.titleNe ?? 'Unknown',
                                                        style: TextStyle(
                                                          color: WHITE,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Material(
                                          color:
                                              PRIMARY_COLOR.withOpacity(0.75),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              ' COVID-19 Cases ',
                                              style: TextStyle(
                                                color: WHITE,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Text('')),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: detailsProvider.districtDetails
                                                  .covidCases.length <
                                              _items
                                          ? detailsProvider
                                              .districtDetails.covidCases.length
                                          : _items,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(height: 4);
                                      },
                                      itemBuilder: (context, index) {
                                        var c = detailsProvider
                                            .districtDetails.covidCases[index];
                                        return Material(
                                          color: WHITE,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          child: ListTile(
                                            dense: true,
                                            isThreeLine: true,
                                            title: Text(
                                              '${c.age ?? 'Unknown Age'} years old '
                                              '${c.gender ?? 'Unknown Gender'} '
                                              'Reported On ${c.reportedOn ?? 'Unknown Date'} ',
                                              style: TextStyle(
                                                color: PRIMARY_COLOR,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'Lable - ${c.label ?? 'Unknown'}\nCurrent State - ${c.currentState ?? 'Unknown'}\n'
                                              '${c.deathOn != null ? 'Death On - ${c.deathOn}\n' : ''}'
                                              '${c.recoveredOn != null ? 'Recovered On - ${c.recoveredOn}\n' : ''}'
                                              '${c.isReinfected == true ? 'Reinfected - YES' : 'Reinfected - NO'}\n'
                                              '${c.source != null ? 'Source - ${c.source}' : 'Unknown'}',
                                              style: TextStyle(
                                                color: STEXT,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            trailing: IconButton(
                                              icon: Icon(
                                                Icons.location_on,
                                                color: Colors.blue,
                                              ),
                                              onPressed: () {
                                                launch(
                                                  'https://www.google.com/maps/search/?api=1&query='
                                                  '${c.point.coordinates[0]},${c.point.coordinates[1]}',
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                  ],
                                )
                              : Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: FlatButton(
                      onPressed: () => _refreshPage(detailsProvider),
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
      ),
    );
  }
}
