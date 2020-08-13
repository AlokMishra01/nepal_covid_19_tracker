import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/dashboard/provider/dashboard_provider.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';

import 'country_item_view.dart';

class CountryListView extends StatelessWidget {
  const CountryListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DashboardProvider>(context);
    return Material(
      color: WHITE,
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR.withOpacity(0.1),
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          elevation: 0,
          title: Text("COVID-19 Stats (By Country)"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () => provider.getWorldCountry(),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: provider.worldByCountry.stats.length + 2,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 8.0,
                    );
                  },
                  itemBuilder: (context, index) {
                    if (index == 0 || index == 1)
                      return SizedBox(
                        height: 4.0,
                      );
                    if (provider.worldByCountry.stats.length + 1 == index)
                      return SizedBox(
                        height: 60.0,
                      );
                    return CountryItemView(
                      data: provider.worldByCountry.stats[index - 1],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
