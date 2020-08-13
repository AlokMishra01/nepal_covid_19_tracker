import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/myths/myth_item_view.dart';
import 'package:nepal_covid_19_tracker/myths/myth_provider.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';

class MythListView extends StatelessWidget {
  const MythListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mythsProvider = Provider.of<MythProvider>(context);
    return Material(
      color: WHITE,
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR.withOpacity(0.1),
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          elevation: 0,
          title: Text('COVID-19 Myths'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () => mythsProvider.initMyths(),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification s) {
                    if (!mythsProvider.loading &&
                        s.metrics.pixels == s.metrics.maxScrollExtent) {
                      mythsProvider.loadMoreMyths();
                      return true;
                    }
                    return false;
                  },
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: mythsProvider.myths.data.length + 2,
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
                      if (mythsProvider.myths.data.length + 1 == index)
                        return SizedBox(
                          height: 60.0,
                        );
                      return MythItemView(
                        data: mythsProvider.myths.data[index - 1],
                      );
                    },
                  ),
                ),
              ),
              mythsProvider.loading
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
