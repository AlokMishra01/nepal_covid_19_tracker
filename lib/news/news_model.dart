class NewsModel {
  List<Data> data;

  NewsModel({this.data});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String sId;
  String lang;
  String url;
  String title;
  String source;
  String summary;
  String imageUrl;
  String createdAt;
  String updatedAt;
  int iV;

  Data(
      {this.sId,
      this.lang,
      this.url,
      this.title,
      this.source,
      this.summary,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lang = json['lang'];
    url = json['url'];
    title = json['title'];
    source = json['source'];
    summary = json['summary'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['lang'] = this.lang;
    data['url'] = this.url;
    data['title'] = this.title;
    data['source'] = this.source;
    data['summary'] = this.summary;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}