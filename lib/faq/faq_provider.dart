import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/faq/faq_model.dart';

class FAQProvider with ChangeNotifier {
  Dio _dio = Dio();
  FAQModel _faqModel;
  int _page = 20;
  bool _isInit = true;
  bool _loading = false;

  FAQProvider() {
    _dio.options.responseType = ResponseType.plain;
    initMyths();
  }

  initMyths() async {
    _page = 20;
    _isInit = true;
    notifyListeners();
    await getFAQs();
  }

  loadMoreFAQs() async {
    _page = _page + 20;
    _loading = true;
    notifyListeners();
    await getFAQs();
  }

  getFAQs() async {
    try {
      Response response = await _dio.get(
        'https://nepalcorona.info/api/v1/faqs?limit=$_page',
      );
      if (response.statusCode == 200) {
        _faqModel = FAQModel.fromJson(
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
  FAQModel get faqs => _faqModel;
  bool get init => _isInit;
  bool get loading => _loading;
}
