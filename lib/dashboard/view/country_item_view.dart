import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/dashboard/model/world_by_country_model.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';

class CountryItemView extends StatelessWidget {
  final Stats data;
  const CountryItemView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          imageUrl:
              data.countryInfo == null ? '' : data.countryInfo.flag,
          errorWidget: (context, url, error) => Image.asset('assets/images/globe.png',height: 28, width: 28,),
          width: 28,
          height: 28,
        ),
        title: Text(
          data.country,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          'Cases ${data.totalCases} '
          '(Today ${data.newCases})\n'
          'Deaths ${data.totalDeaths} '
          '(Today ${data.newDeaths})',
          style: TextStyle(
            color: STEXT,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
