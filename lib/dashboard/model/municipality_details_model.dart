class MunicipalityDetailsModel {
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
  //List<Null> covidCases;
  Demographics demographics;
  Contact contact;
  List<Wards> wards;
  //List<Null> healthFacilities;

  MunicipalityDetailsModel(
      {this.sId,
      this.id,
      this.bbox,
      this.centroid,
      this.title,
      this.titleEn,
      this.titleNe,
      this.type,
      this.code,
      this.district,
      //this.covidCases,
      this.demographics,
      this.contact,
      this.wards,
      //this.healthFacilities,
      });

  MunicipalityDetailsModel.fromJson(Map<String, dynamic> json) {
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
    // if (json['covid_cases'] != null) {
    //   covidCases = new List<Null>();
    //   json['covid_cases'].forEach((v) {
    //     covidCases.add(new Null.fromJson(v));
    //   });
    // }
    demographics = json['demographics'] != null
        ? new Demographics.fromJson(json['demographics'])
        : null;
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    if (json['wards'] != null) {
      wards = new List<Wards>();
      json['wards'].forEach((v) {
        wards.add(new Wards.fromJson(v));
      });
    }
    // if (json['health_facilities'] != null) {
    //   healthFacilities = new List<Null>();
    //   json['health_facilities'].forEach((v) {
    //     healthFacilities.add(new Null.fromJson(v));
    //   });
    // }
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
    // if (this.covidCases != null) {
    //   data['covid_cases'] = this.covidCases.map((v) => v.toJson()).toList();
    // }
    if (this.demographics != null) {
      data['demographics'] = this.demographics.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact.toJson();
    }
    if (this.wards != null) {
      data['wards'] = this.wards.map((v) => v.toJson()).toList();
    }
    // if (this.healthFacilities != null) {
    //   data['health_facilities'] =
    //       this.healthFacilities.map((v) => v.toJson()).toList();
    // }
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

class Demographics {
  String sId;
  int id;
  int totalPopulation;
  int malePopulation;
  int femalePopulation;
  int householdCount;
  double maleLiteracyRate;
  double femaleLiteracyRate;
  double literacyRate;
  AgeGroupPopulation ageGroupPopulation;
  int municipality;

  Demographics(
      {this.sId,
      this.id,
      this.totalPopulation,
      this.malePopulation,
      this.femalePopulation,
      this.householdCount,
      this.maleLiteracyRate,
      this.femaleLiteracyRate,
      this.literacyRate,
      this.ageGroupPopulation,
      this.municipality});

  Demographics.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    totalPopulation = json['totalPopulation'];
    malePopulation = json['malePopulation'];
    femalePopulation = json['femalePopulation'];
    householdCount = json['householdCount'];
    maleLiteracyRate = json['maleLiteracyRate'];
    femaleLiteracyRate = json['femaleLiteracyRate'];
    literacyRate = json['literacyRate'];
    ageGroupPopulation = json['ageGroupPopulation'] != null
        ? new AgeGroupPopulation.fromJson(json['ageGroupPopulation'])
        : null;
    municipality = json['municipality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['totalPopulation'] = this.totalPopulation;
    data['malePopulation'] = this.malePopulation;
    data['femalePopulation'] = this.femalePopulation;
    data['householdCount'] = this.householdCount;
    data['maleLiteracyRate'] = this.maleLiteracyRate;
    data['femaleLiteracyRate'] = this.femaleLiteracyRate;
    data['literacyRate'] = this.literacyRate;
    if (this.ageGroupPopulation != null) {
      data['ageGroupPopulation'] = this.ageGroupPopulation.toJson();
    }
    data['municipality'] = this.municipality;
    return data;
  }
}

class AgeGroupPopulation {
  Male male;
  Male female;

  AgeGroupPopulation({this.male, this.female});

  AgeGroupPopulation.fromJson(Map<String, dynamic> json) {
    male = json['male'] != null ? new Male.fromJson(json['male']) : null;
    female = json['female'] != null ? new Male.fromJson(json['female']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.male != null) {
      data['male'] = this.male.toJson();
    }
    if (this.female != null) {
      data['female'] = this.female.toJson();
    }
    return data;
  }
}

class Male {
  int i75;
  int i0004;
  int i0509;
  int i1014;
  int i1519;
  int i2024;
  int i2529;
  int i3034;
  int i3539;
  int i4044;
  int i4549;
  int i5054;
  int i5559;
  int i6064;
  int i6569;
  int i7074;

  Male(
      {this.i75,
      this.i0004,
      this.i0509,
      this.i1014,
      this.i1519,
      this.i2024,
      this.i2529,
      this.i3034,
      this.i3539,
      this.i4044,
      this.i4549,
      this.i5054,
      this.i5559,
      this.i6064,
      this.i6569,
      this.i7074});

  Male.fromJson(Map<String, dynamic> json) {
    i75 = json['75+'];
    i0004 = json['00-04'];
    i0509 = json['05-09'];
    i1014 = json['10-14'];
    i1519 = json['15-19'];
    i2024 = json['20-24'];
    i2529 = json['25-29'];
    i3034 = json['30-34'];
    i3539 = json['35-39'];
    i4044 = json['40-44'];
    i4549 = json['45-49'];
    i5054 = json['50-54'];
    i5559 = json['55-59'];
    i6064 = json['60-64'];
    i6569 = json['65-69'];
    i7074 = json['70-74'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['75+'] = this.i75;
    data['00-04'] = this.i0004;
    data['05-09'] = this.i0509;
    data['10-14'] = this.i1014;
    data['15-19'] = this.i1519;
    data['20-24'] = this.i2024;
    data['25-29'] = this.i2529;
    data['30-34'] = this.i3034;
    data['35-39'] = this.i3539;
    data['40-44'] = this.i4044;
    data['45-49'] = this.i4549;
    data['50-54'] = this.i5054;
    data['55-59'] = this.i5559;
    data['60-64'] = this.i6064;
    data['65-69'] = this.i6569;
    data['70-74'] = this.i7074;
    return data;
  }
}

class Contact {
  String sId;
  int id;
  String name;
  String image;
  String position;
  String email;
  String workNumber;
  String mobileNumber;
  bool isDrrFocalPerson;
  String committee;
  String communityAddress;
  Centroid point;
  int organization;
  int province;
  int district;
  int municipality;
  int ward;

  Contact(
      {this.sId,
      this.id,
      this.name,
      this.image,
      this.position,
      this.email,
      this.workNumber,
      this.mobileNumber,
      this.isDrrFocalPerson,
      this.committee,
      this.communityAddress,
      this.point,
      this.organization,
      this.province,
      this.district,
      this.municipality,
      this.ward});

  Contact.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    image = json['image'];
    position = json['position'];
    email = json['email'];
    workNumber = json['workNumber'];
    mobileNumber = json['mobileNumber'];
    isDrrFocalPerson = json['isDrrFocalPerson'];
    committee = json['committee'];
    communityAddress = json['communityAddress'];
    point = json['point'] != null ? new Centroid.fromJson(json['point']) : null;
    organization = json['organization'];
    province = json['province'];
    district = json['district'];
    municipality = json['municipality'];
    ward = json['ward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['position'] = this.position;
    data['email'] = this.email;
    data['workNumber'] = this.workNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['isDrrFocalPerson'] = this.isDrrFocalPerson;
    data['committee'] = this.committee;
    data['communityAddress'] = this.communityAddress;
    if (this.point != null) {
      data['point'] = this.point.toJson();
    }
    data['organization'] = this.organization;
    data['province'] = this.province;
    data['district'] = this.district;
    data['municipality'] = this.municipality;
    data['ward'] = this.ward;
    return data;
  }
}

class Wards {
  String sId;
  int id;
  List<double> bbox;
  Centroid centroid;
  String title;
  int municipality;

  Wards(
      {this.sId,
      this.id,
      this.bbox,
      this.centroid,
      this.title,
      this.municipality});

  Wards.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    bbox = json['bbox'].cast<double>();
    centroid = json['centroid'] != null
        ? new Centroid.fromJson(json['centroid'])
        : null;
    title = json['title'];
    municipality = json['municipality'];
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
    data['municipality'] = this.municipality;
    return data;
  }
}