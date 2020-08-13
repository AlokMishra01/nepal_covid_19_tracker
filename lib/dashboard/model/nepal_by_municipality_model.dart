class NepalByMunicipalityModel {
  List<Municipalities> municipalities;

  NepalByMunicipalityModel({this.municipalities});

  NepalByMunicipalityModel.fromJson(Map<String, dynamic> json) {
    if (json['municipalities'] != null) {
      municipalities = new List<Municipalities>();
      json['municipalities'].forEach((v) {
        municipalities.add(new Municipalities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.municipalities != null) {
      data['municipalities'] =
          this.municipalities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Municipalities {
  int id;
  int province;
  int district;
  int municipality;
  String createdOn;
  String modifiedOn;
  String label;
  String gender;
  int age;
  Point point;
  Null occupation;
  String reportedOn;
  String recoveredOn;
  String deathOn;
  String currentState;
  bool isReinfected;
  String source;
  String comment;
  String type;
  int nationality;
  int ward;

  Municipalities(
      {this.id,
      this.province,
      this.district,
      this.municipality,
      this.createdOn,
      this.modifiedOn,
      this.label,
      this.gender,
      this.age,
      this.point,
      this.occupation,
      this.reportedOn,
      this.recoveredOn,
      this.deathOn,
      this.currentState,
      this.isReinfected,
      this.source,
      this.comment,
      this.type,
      this.nationality,
      this.ward,
      });

  Municipalities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    province = json['province'];
    district = json['district'];
    municipality = json['municipality'];
    createdOn = json['createdOn'];
    modifiedOn = json['modifiedOn'];
    label = json['label'];
    gender = json['gender'];
    age = json['age'];
    point = json['point'] != null ? new Point.fromJson(json['point']) : null;
    occupation = json['occupation'];
    reportedOn = json['reportedOn'];
    recoveredOn = json['recoveredOn'];
    deathOn = json['deathOn'];
    currentState = json['currentState'];
    isReinfected = json['isReinfected'];
    source = json['source'];
    comment = json['comment'];
    type = json['type'];
    nationality = json['nationality'];
    ward = json['ward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['occupation'] = this.occupation;
    data['reportedOn'] = this.reportedOn;
    data['recoveredOn'] = this.recoveredOn;
    data['deathOn'] = this.deathOn;
    data['currentState'] = this.currentState;
    data['isReinfected'] = this.isReinfected;
    data['source'] = this.source;
    data['comment'] = this.comment;
    data['type'] = this.type;
    data['nationality'] = this.nationality;
    data['ward'] = this.ward;
    return data;
  }
}

class Point {
  String type;
  List<double> coordinates;

  Point({this.type, this.coordinates});

  Point.fromJson(Map<String, dynamic> json) {
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