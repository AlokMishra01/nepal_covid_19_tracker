import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/details/model/district_details_model.dart';
import 'package:nepal_covid_19_tracker/details/model/district_model.dart';
import 'package:nepal_covid_19_tracker/details/model/municipality_details_model.dart';

class DetailsProvider with ChangeNotifier {
  Dio _dio = Dio();
  DistrictModel _districtModel;
  DistrictDetailsModel _districtDetailsModel;
  MunicipalityDetailsModel _municipalityDetailsModel;

  DetailsProvider() {
    _dio.options.responseType = ResponseType.plain;
    getDistricts();
    getgetDistrictDetails(27);
  }

  getDistricts() async {
    try {
      Response response = await _dio.get(
        'https://data.nepalcorona.info/api/v1/districts',
      );
      if (response.statusCode == 200) {
        _districtModel = DistrictModel.fromJson(
          jsonDecode('{"districts":${response.data}}'),
        );
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  getgetDistrictDetails(int id) async {
    _districtDetailsModel = null;
    notifyListeners();
    try {
      Response response = await _dio.get(
        'https://data.nepalcorona.info/api/v1/districts/$id',
      );
      if (response.statusCode == 200) {
        _districtDetailsModel = DistrictDetailsModel.fromJson(
          jsonDecode(response.data),
        );
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  getgetMunicipalityDetails(int id) async {
    _municipalityDetailsModel = null;
    notifyListeners();
    try {
      Response response = await _dio.get(
        'https://data.nepalcorona.info/api/v1/municipals/$id',
      );
      if (response.statusCode == 200) {
        _municipalityDetailsModel = MunicipalityDetailsModel.fromJson(
          jsonDecode(response.data),
        );
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  // getters
  DistrictModel get districts => _districtModel;
  DistrictDetailsModel get districtDetails => _districtDetailsModel;
  MunicipalityDetailsModel get municipalityDetails => _municipalityDetailsModel;
}
