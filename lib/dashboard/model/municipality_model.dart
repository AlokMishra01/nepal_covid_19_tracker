class MunicipalityModel {
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

  MunicipalityModel(
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

  MunicipalityModel.fromJson(Map<String, dynamic> json) {
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