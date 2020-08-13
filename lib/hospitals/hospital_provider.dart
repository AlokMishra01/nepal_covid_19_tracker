import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/hospitals/nepal_hospital_model.dart';

class HospitalProvider with ChangeNotifier {
  Dio _dio = Dio();
  NepalHospitalModel _hospitalModel;
  int _page = 20;
  bool _isInit = true;
  bool _loading = false;

  HospitalProvider() {
    _dio.options.responseType = ResponseType.plain;
    initData();
  }

  initData() async {
    _page = 20;
    await get();
  }

  loadMore() async {
    _page = _page + 20;
    _loading = true;
    notifyListeners();
    await get();
  }

  get() async {
    try {
      Response response = await _dio.get(
        'https://nepalcorona.info/api/v1/hospitals?limit=$_page',
      );
      if (response.statusCode == 200) {
        _hospitalModel = NepalHospitalModel.fromJson(
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
  NepalHospitalModel get hospitals => _hospitalModel;
  bool get init => _isInit;
  bool get loading => _loading;
}
