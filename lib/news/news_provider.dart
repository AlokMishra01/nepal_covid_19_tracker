import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/news/news_model.dart';

class NewsProvider with ChangeNotifier {
  Dio _dio = Dio();
  NewsModel _newsModel;
  int _page = 20;
  bool _isInit = true;
  bool _loading = false;

  NewsProvider() {
    _dio.options.responseType = ResponseType.plain;
    initNews();
  }

  initNews() async {
    _page = 20;
    await getNews();
  }

  loadMoreNews() async {
    _page = _page + 20;
    _loading = true;
    notifyListeners();
    await getNews();
  }

  getNews() async {
    try {
      Response response = await _dio.get(
        'https://nepalcorona.info/api/v1/news?limit=$_page',
      );
      if (response.statusCode == 200) {
        _newsModel = NewsModel.fromJson(
          jsonDecode(response.data),
        );
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    _isInit = false;
    _loading = false;
    notifyListeners();
  }

  // getters
  NewsModel get news => _newsModel;
  bool get init => _isInit;
  bool get loading => _loading;
}
