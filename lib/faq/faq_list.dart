import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/faq/faq_item_view.dart';
import 'package:nepal_covid_19_tracker/faq/faq_provider.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';

class FAQListView extends StatelessWidget {
  const FAQListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FAQProvider>(context);
    return Material(
      color: WHITE,
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR.withOpacity(0.1),
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          elevation: 0,
          title: Text("COVID-19 FAQ's"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () => provider.initMyths(),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification s) {
                    if (!provider.loading &&
                        s.metrics.pixels == s.metrics.maxScrollExtent) {
                      provider.loadMoreFAQs();
                      return true;
                    }
                    return false;
                  },
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: provider.faqs.data.length + 2,
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
                      if (provider.faqs.data.length + 1 == index)
                        return SizedBox(
                          height: 60.0,
                        );
                      return FAQItemView(
                        data: provider.faqs.data[index - 1],
                      );
                    },
                  ),
                ),
              ),
              provider.loading
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
