import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/resources/nepal_resources_model.dart';

class RecourceProvider with ChangeNotifier {
  Dio _dio = Dio();
  ResourcesModel _healthResources;

  RecourceProvider() {
    _dio.options.responseType = ResponseType.plain;
    getRecources();
  }

  getRecources() async {
    try {
      Response response = await _dio.get(
        'https://data.nepalcorona.info/api/v1/resources/health',
      );
      if (response.statusCode == 200) {
        _healthResources = ResourcesModel.fromJson(
          jsonDecode('{"resources":${response.data}}'),
        );
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  // getters
  ResourcesModel get resources => _healthResources;
}
