class NepalSummaryCountModel {
  int total;
  List<CurrentState> currentState;
  Province province;
  Province district;
  Province municipality;
  Province gender;
  Province type;
  Province ageGroup;

  NepalSummaryCountModel(
      {this.total,
      this.currentState,
      this.province,
      this.district,
      this.municipality,
      this.gender,
      this.type,
      this.ageGroup});

  NepalSummaryCountModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['current_state'] != null) {
      currentState = new List<CurrentState>();
      json['current_state'].forEach((v) {
        currentState.add(new CurrentState.fromJson(v));
      });
    }
    province = json['province'] != null
        ? new Province.fromJson(json['province'])
        : null;
    district = json['district'] != null
        ? new Province.fromJson(json['district'])
        : null;
    municipality = json['municipality'] != null
        ? new Province.fromJson(json['municipality'])
        : null;
    gender =
        json['gender'] != null ? new Province.fromJson(json['gender']) : null;
    type = json['type'] != null ? new Province.fromJson(json['type']) : null;
    ageGroup = json['age_group'] != null
        ? new Province.fromJson(json['age_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.currentState != null) {
      data['current_state'] = this.currentState.map((v) => v.toJson()).toList();
    }
    if (this.province != null) {
      data['province'] = this.province.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district.toJson();
    }
    if (this.municipality != null) {
      data['municipality'] = this.municipality.toJson();
    }
    if (this.gender != null) {
      data['gender'] = this.gender.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    if (this.ageGroup != null) {
      data['age_group'] = this.ageGroup.toJson();
    }
    return data;
  }
}

class CurrentState {
  int count;
  String currentState;

  CurrentState({this.count, this.currentState});

  CurrentState.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    currentState = json['currentState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['currentState'] = this.currentState;
    return data;
  }
}

class Province {
  List<Cases> cases;
  List<Cases> active;
  List<Cases> recovered;
  List<Cases> deaths;

  Province({this.cases, this.active, this.recovered, this.deaths});

  Province.fromJson(Map<String, dynamic> json) {
    if (json['cases'] != null) {
      cases = new List<Cases>();
      json['cases'].forEach((v) {
        cases.add(new Cases.fromJson(v));
      });
    }
    if (json['active'] != null) {
      active = new List<Cases>();
      json['active'].forEach((v) {
        active.add(new Cases.fromJson(v));
      });
    }
    if (json['recovered'] != null) {
      recovered = new List<Cases>();
      json['recovered'].forEach((v) {
        recovered.add(new Cases.fromJson(v));
      });
    }
    if (json['deaths'] != null) {
      deaths = new List<Cases>();
      json['deaths'].forEach((v) {
        deaths.add(new Cases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cases != null) {
      data['cases'] = this.cases.map((v) => v.toJson()).toList();
    }
    if (this.active != null) {
      data['active'] = this.active.map((v) => v.toJson()).toList();
    }
    if (this.recovered != null) {
      data['recovered'] = this.recovered.map((v) => v.toJson()).toList();
    }
    if (this.deaths != null) {
      data['deaths'] = this.deaths.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cases {
  int count;
  int province;
  int district;
  int municipality;
  String gender;
  String type;
  String age;

  Cases({this.count, this.province});

  Cases.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    province = json['province'];
    district = json['district'];
    municipality = json['municipality'];
    gender = json['gender'];
    type = json['type'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['province'] = this.province;
    data['district'] = this.district;
    data['municipality'] = this.municipality;
    data['gender'] = this.gender;
    data['type'] = this.type;
    data['age'] = this.age;

    return data;
  }
}
