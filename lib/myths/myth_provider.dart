import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/myths/nepali_myths_model.dart';

class MythProvider with ChangeNotifier {
  Dio _dio = Dio();
  NepaliMythsModel _mythsModel;
  int _page = 20;
  bool _isInit = true;
  bool _loading = false;

  MythProvider() {
    _dio.options.responseType = ResponseType.plain;
    initMyths();
  }

  initMyths() async {
    _page = 20;
    _isInit = true;
    notifyListeners();
    await getMyths();
  }

  loadMoreMyths() async {
    _page = _page + 20;
    _loading = true;
    notifyListeners();
    await getMyths();
  }

  getMyths() async {
    try {
      Response response = await _dio.get(
        'https://nepalcorona.info/api/v1/myths?limit=$_page',
      );
      if (response.statusCode == 200) {
        _mythsModel = NepaliMythsModel.fromJson(
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
  NepaliMythsModel get myths => _mythsModel;
  bool get init => _isInit;
  bool get loading => _loading;
}
