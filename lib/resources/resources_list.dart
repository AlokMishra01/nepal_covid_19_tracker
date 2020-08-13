import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/resources/resources_item_view.dart';
import 'package:nepal_covid_19_tracker/resources/resources_provider.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';

class ResourcesListView extends StatelessWidget {
  const ResourcesListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecourceProvider>(context);
    return Material(
      color: WHITE,
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR.withOpacity(0.1),
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          elevation: 0,
          title: Text("Nepal Health Resources"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () => provider.getRecources(),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: provider.resources.resources.length + 2,
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
                    if (provider.resources.resources.length + 1 == index)
                      return SizedBox(
                        height: 60.0,
                      );
                    return ResourcesItemView(
                      data: provider.resources.resources[index - 1],
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
