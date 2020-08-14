class DistrictDetailsModel {
  String sId;
  int id;
  //List<double> bbox;
  Centroid centroid;
  String title;
  String titleEn;
  String titleNe;
  String code;
  int province;
  List<CovidCases> covidCases;
  List<Municipalities> municipalities;
  CovidSummary covidSummary;

  DistrictDetailsModel(
      {this.sId,
      this.id,
      //this.bbox,
      this.centroid,
      this.title,
      this.titleEn,
      this.titleNe,
      this.code,
      this.province,
      this.covidCases,
      this.municipalities,
      this.covidSummary});

  DistrictDetailsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    //bbox = json['bbox'].cast<double>();
    centroid = json['centroid'] != null
        ? new Centroid.fromJson(json['centroid'])
        : null;
    title = json['title'];
    titleEn = json['title_en'];
    titleNe = json['title_ne'];
    code = json['code'];
    province = json['province'];
    if (json['covid_cases'] != null) {
      covidCases = new List<CovidCases>();
      json['covid_cases'].forEach((v) {
        covidCases.add(new CovidCases.fromJson(v));
      });
    }
    if (json['municipalities'] != null) {
      municipalities = new List<Municipalities>();
      json['municipalities'].forEach((v) {
        municipalities.add(new Municipalities.fromJson(v));
      });
    }
    covidSummary = json['covid_summary'] != null
        ? new CovidSummary.fromJson(json['covid_summary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    //data['bbox'] = this.bbox;
    if (this.centroid != null) {
      data['centroid'] = this.centroid.toJson();
    }
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['title_ne'] = this.titleNe;
    data['code'] = this.code;
    data['province'] = this.province;
    if (this.covidCases != null) {
      data['covid_cases'] = this.covidCases.map((v) => v.toJson()).toList();
    }
    if (this.municipalities != null) {
      data['municipalities'] =
          this.municipalities.map((v) => v.toJson()).toList();
    }
    if (this.covidSummary != null) {
      data['covid_summary'] = this.covidSummary.toJson();
    }
    return data;
  }
}

class Centroid {
  String type;
  List<double> coordinates;

  Centroid({this.type, this.coordinates});

  Centroid.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class CovidCases {
  String sId;
  int id;
  int province;
  int district;
  int municipality;
  String createdOn;
  String modifiedOn;
  String label;
  String gender;
  int age;
  Centroid point;
  //Null occupation;
  String reportedOn;
  String recoveredOn;
  String deathOn;
  String currentState;
  bool isReinfected;
  String source;
  String comment;
  //String type;
  //int nationality;
  int ward;
  //List<Null> relatedTo;

  CovidCases({
    this.sId,
    this.id,
    this.province,
    this.district,
    this.municipality,
    this.createdOn,
    this.modifiedOn,
    this.label,
    this.gender,
    this.age,
    this.point,
    //this.occupation,
    this.reportedOn,
    this.recoveredOn,
    this.deathOn,
    this.currentState,
    this.isReinfected,
    this.source,
    this.comment,
    // this.type,
    // this.nationality,
    this.ward,
    //this.relatedTo,
  });

  CovidCases.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    province = json['province'];
    district = json['district'];
    municipality = json['municipality'];
    createdOn = json['createdOn'];
    modifiedOn = json['modifiedOn'];
    label = json['label'];
    gender = json['gender'];
    age = json['age'];
    point = json['point'] != null ? new Centroid.fromJson(json['point']) : null;
    //occupation = json['occupation'];
    reportedOn = json['reportedOn'];
    recoveredOn = json['recoveredOn'];
    deathOn = json['deathOn'];
    currentState = json['currentState'];
    isReinfected = json['isReinfected'];
    source = json['source'];
    comment = json['comment'];
    // type = json['type'];
    // nationality = json['nationality'];
    ward = json['ward'];
    // if (json['relatedTo'] != null) {
    //   relatedTo = new List<Null>();
    //   json['relatedTo'].forEach((v) {
    //     relatedTo.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['province'] = this.province;
    data['district'] = this.district;
    data['municipality'] = this.municipality;
    data['createdOn'] = this.createdOn;
    data['modifiedOn'] = this.modifiedOn;
    data['label'] = this.label;
    data['gender'] = this.gender;
    data['age'] = this.age;
    if (this.point != null) {
      data['point'] = this.point.toJson();
    }
    //data['occupation'] = this.occupation;
    data['reportedOn'] = this.reportedOn;
    data['recoveredOn'] = this.recoveredOn;
    data['deathOn'] = this.deathOn;
    data['currentState'] = this.currentState;
    data['isReinfected'] = this.isReinfected;
    data['source'] = this.source;
    data['comment'] = this.comment;
    // data['type'] = this.type;
    // data['nationality'] = this.nationality;
    data['ward'] = this.ward;
    // if (this.relatedTo != null) {
    //   data['relatedTo'] = this.relatedTo.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Municipalities {
  String sId;
  int id;
  List<double> bbox;
  Centroid centroid;
  String title;
  String titleEn;
  String titleNe;
  String type;
  String code;
  int district;

  Municipalities(
      {this.sId,
      this.id,
      this.bbox,
      this.centroid,
      this.title,
      this.titleEn,
      this.titleNe,
      this.type,
      this.code,
      this.district});

  Municipalities.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    bbox = json['bbox'].cast<double>();
    centroid = json['centroid'] != null
        ? new Centroid.fromJson(json['centroid'])
        : null;
    title = json['title'];
    titleEn = json['title_en'];
    titleNe = json['title_ne'];
    type = json['type'];
    code = json['code'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['bbox'] = this.bbox;
    if (this.centroid != null) {
      data['centroid'] = this.centroid.toJson();
    }
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['title_ne'] = this.titleNe;
    data['type'] = this.type;
    data['code'] = this.code;
    data['district'] = this.district;
    return data;
  }
}

class CovidSummary {
  int cases;
  int active;
  int recovered;
  int death;

  CovidSummary({this.cases, this.active, this.recovered, this.death});

  CovidSummary.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    active = json['active'];
    recovered = json['recovered'];
    death = json['death'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cases'] = this.cases;
    data['active'] = this.active;
    data['recovered'] = this.recovered;
    data['death'] = this.death;
    return data;
  }
}
