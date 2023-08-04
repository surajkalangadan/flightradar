class Flightmodel {
  Flightmodel({
      this.version, 
      this.rows,});

  Flightmodel.fromJson(dynamic json) {
    version = json['version'];
    if (json['rows'] != null) {
      rows = [];
      json['rows'].forEach((v) {
        rows?.add(Rows.fromJson(v));
      });
    }
  }
  int? version;
  List<Rows>? rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version'] = version;
    if (rows != null) {
      map['rows'] = rows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Rows {
  Rows({
      this.description, 
      this.models,});

  Rows.fromJson(dynamic json) {
    description = json['description'];
    if (json['models'] != null) {
      models = [];
      json['models'].forEach((v) {
        models?.add(Models.fromJson(v));
      });
    }
  }
  String? description;
  List<Models>? models;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    if (models != null) {
      map['models'] = models?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Models {
  Models({
      this.name, 
      this.code,});

  Models.fromJson(dynamic json) {
    name = json['Name'];
    code = json['Code'];
  }
  String? name;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['Code'] = code;
    return map;
  }

}