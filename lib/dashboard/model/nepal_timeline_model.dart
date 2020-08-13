class NepalTimelineModel {
  List<Timelines> timelines;

  NepalTimelineModel({this.timelines});

  NepalTimelineModel.fromJson(Map<String, dynamic> json) {
    if (json['timelines'] != null) {
      timelines = new List<Timelines>();
      json['timelines'].forEach((v) {
        timelines.add(new Timelines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.timelines != null) {
      data['timelines'] = this.timelines.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timelines {
  String date;
  int totalCases;
  int newCases;
  int totalRecoveries;
  int newRecoveries;
  int totalDeaths;
  int newDeaths;

  Timelines(
      {this.date,
      this.totalCases,
      this.newCases,
      this.totalRecoveries,
      this.newRecoveries,
      this.totalDeaths,
      this.newDeaths});

  Timelines.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    totalCases = json['totalCases'];
    newCases = json['newCases'];
    totalRecoveries = json['totalRecoveries'];
    newRecoveries = json['newRecoveries'];
    totalDeaths = json['totalDeaths'];
    newDeaths = json['newDeaths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['totalCases'] = this.totalCases;
    data['newCases'] = this.newCases;
    data['totalRecoveries'] = this.totalRecoveries;
    data['newRecoveries'] = this.newRecoveries;
    data['totalDeaths'] = this.totalDeaths;
    data['newDeaths'] = this.newDeaths;
    return data;
  }
}
