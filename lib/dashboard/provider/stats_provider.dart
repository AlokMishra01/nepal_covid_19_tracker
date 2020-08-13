import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/dashboard/model/nepal_timeline_model.dart';

class StatsProvider with ChangeNotifier {
  Dio _dio = Dio();
  NepalTimelineModel _timelineModel;

  StatsProvider() {
    _dio.options.responseType = ResponseType.plain;
    getNepalTimeline();
  }

  getNepalTimeline() async {
    try {
      Response response = await _dio.get(
        'https://data.nepalcorona.info/api/v1/covid/timeline',
      );
      if (response.statusCode == 200) {
        _timelineModel = NepalTimelineModel.fromJson(
          jsonDecode('{"timelines":${response.data}}'),
        );
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  // getters
  NepalTimelineModel get timeline => _timelineModel;
}
