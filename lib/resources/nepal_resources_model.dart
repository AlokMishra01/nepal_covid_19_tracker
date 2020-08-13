class ResourcesModel {
  List<Resources> resources;

  ResourcesModel({this.resources});

  ResourcesModel.fromJson(Map<String, dynamic> json) {
    if (json['resources'] != null) {
      resources = new List<Resources>();
      json['resources'].forEach((v) {
        resources.add(new Resources.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resources != null) {
      data['resources'] = this.resources.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Resources {
  String sId;
  int id;
  String resourceType;
  String title;
  String description;
  Point point;
  int ward;

  Resources(
      {this.sId,
      this.id,
      this.resourceType,
      this.title,
      this.description,
      this.point,
      this.ward});

  Resources.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    resourceType = json['resourceType'];
    title = json['title'];
    description = json['description'];
    point = json['point'] != null ? new Point.fromJson(json['point']) : null;
    ward = json['ward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['resourceType'] = this.resourceType;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.point != null) {
      data['point'] = this.point.toJson();
    }
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