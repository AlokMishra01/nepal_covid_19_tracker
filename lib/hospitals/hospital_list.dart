import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/hospitals/hospital_item_view.dart';
import 'package:nepal_covid_19_tracker/hospitals/hospital_provider.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';

class HospitalListView extends StatelessWidget {
  const HospitalListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hospitalProvider = Provider.of<HospitalProvider>(context);
    return Material(
      color: PRIMARY_COLOR.withOpacity(0.1),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () => hospitalProvider.initData(),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification s) {
                    if (!hospitalProvider.loading &&
                        s.metrics.pixels == s.metrics.maxScrollExtent) {
                      hospitalProvider.loadMore();
                      return true;
                    }
                    return false;
                  },
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: hospitalProvider.hospitals.data.length + 2,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 8.0,
                      );
                    },
                    itemBuilder: (context, index) {
                      if (index == 0)
                        return SizedBox(
                          height: 8.0,
                        );
                      if (hospitalProvider.hospitals.data.length + 1 == index)
                        return SizedBox(
                          height: 60.0,
                        );
                      return HospitalItemView(
                        data: hospitalProvider.hospitals.data[index - 1],
                      );
                    },
                  ),
                ),
              ),
              hospitalProvider.loading
                  ? Positioned(
                      bottom: 8.0,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: CircleAvatar(
                                backgroundColor: WHITE,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
