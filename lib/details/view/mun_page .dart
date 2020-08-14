import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/details/model/district_details_model.dart';
import 'package:nepal_covid_19_tracker/details/provider/details_provider.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MunDetailsPage extends StatefulWidget {
  final Municipalities municipalities;
  const MunDetailsPage({Key key, this.municipalities}) : super(key: key);

  @override
  _MunDetailsPageState createState() => _MunDetailsPageState();
}

class _MunDetailsPageState extends State<MunDetailsPage> {
  bool _isInit = false;
  int _items = 10;

  _refreshPage(DetailsProvider d) async {
    _items = 10;
    await d.getgetMunicipalityDetails(widget.municipalities.id);
  }

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<DetailsProvider>(context);
    if (!_isInit) {
      _isInit = true;
      _refreshPage(detailsProvider);
    }
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: PRIMARY_COLOR.withOpacity(0.1),
          appBar: AppBar(
            backgroundColor: PRIMARY_COLOR,
            elevation: 0,
            title:
                Text('${widget.municipalities.titleNe} Municipality Details'),
          ),
          body: RefreshIndicator(
            onRefresh: () => _refreshPage(detailsProvider),
            child: (detailsProvider.districts != null)
                ? NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification s) {
                      if (s.metrics.pixels == s.metrics.maxScrollExtent) {
                        if (detailsProvider
                                .municipalityDetails.covidCases.length >
                            _items + 10)
                          setState(() {
                            _items = _items + 10;
                          });
                        else
                          setState(() {
                            _items = detailsProvider
                                .municipalityDetails.covidCases.length;
                          });
                        return true;
                      }
                      return false;
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: detailsProvider.municipalityDetails != null
                              ? detailsProvider
                                      .municipalityDetails.covidCases.isNotEmpty
                                  ? ListView(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      children: [
                                        SizedBox(
                                          height: 16.0,
                                        ),
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: detailsProvider
                                                      .municipalityDetails
                                                      .covidCases
                                                      .length <
                                                  _items
                                              ? detailsProvider
                                                  .municipalityDetails
                                                  .covidCases
                                                  .length
                                              : _items,
                                          separatorBuilder: (context, index) {
                                            return SizedBox(height: 4);
                                          },
                                          itemBuilder: (context, index) {
                                            var c = detailsProvider
                                                .municipalityDetails
                                                .covidCases[index];
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
                                  : Center(
                                      child: Text(
                                        'No COVID-19 Case Reported.',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
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
