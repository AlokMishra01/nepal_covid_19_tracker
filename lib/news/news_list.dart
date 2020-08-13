import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/news/news_item_view.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:provider/provider.dart';

import 'news_provider.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return Material(
      color: WHITE,
      child: Scaffold(
          backgroundColor: PRIMARY_COLOR.withOpacity(0.1),
          appBar: AppBar(
            backgroundColor: PRIMARY_COLOR,
            elevation: 0,
            title: Text('COVID-19 News'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () => newsProvider.initNews(),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification s) {
                      if (!newsProvider.loading &&
                          s.metrics.pixels == s.metrics.maxScrollExtent) {
                        newsProvider.loadMoreNews();
                        return true;
                      }
                      return false;
                    },
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: newsProvider.news.data.length + 2,
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
                        if (newsProvider.news.data.length + 1 == index)
                          return SizedBox(
                            height: 60.0,
                          );
                        return NewsItemView(
                          data: newsProvider.news.data[index - 1],
                        );
                      },
                    ),
                  ),
                ),
                newsProvider.loading
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
          )),
    );
  }
}
