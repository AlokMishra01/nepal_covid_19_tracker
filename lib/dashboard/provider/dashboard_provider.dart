import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/dashboard/model/nepal_summery_model.dart';
import 'package:nepal_covid_19_tracker/dashboard/model/world_by_country_model.dart';
import 'package:nepal_covid_19_tracker/dashboard/model/world_summery_model.dart';

class DashboardProvider with ChangeNotifier {
  Dio _dio = Dio();
  NepalSummeryModel _nepalSummeryModel;
  WorldSummeryModel _worldSummeryModel;
  WorldByCountryModel _worldByCountryModel;

  DashboardProvider() {
    _dio.options.responseType = ResponseType.plain;
    getNepalSummery();
    getWorldSummery();
    getWorldCountry();
  }

  getNepalSummery() async {
    try {
      Response response = await _dio.get(
        'https://nepalcorona.info/api/v1/data/nepal',
      );
      if (response.statusCode == 200) {
        _nepalSummeryModel = NepalSummeryModel.fromJson(
          jsonDecode(response.data),
        );
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  getWorldSummery() async {
    try {
      Response response = await _dio.get(
        'https://data.nepalcorona.info/api/v1/world',
      );
      if (response.statusCode == 200) {
        _worldSummeryModel = WorldSummeryModel.fromJson(
          jsonDecode(response.data),
        );
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  getWorldCountry() async {
    try {
      Response response = await _dio.get(
        'https://nepalcorona.info/api/v1/data/world',
      );
      if (response.statusCode == 200) {
        _worldByCountryModel = WorldByCountryModel.fromJson(
          jsonDecode('{"stats": ${response.data}}'),
        );
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  // getters
  NepalSummeryModel get nepakSummery => _nepalSummeryModel;
  WorldSummeryModel get worldSummery => _worldSummeryModel;
  WorldByCountryModel get worldByCountry => _worldByCountryModel;
}
