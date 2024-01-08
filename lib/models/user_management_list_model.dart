class UserManagementListModel {
  List<Data>? data;
  List<Columns>? columns;

  UserManagementListModel({this.data, this.columns});

  UserManagementListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['columns'] != null) {
      columns = <Columns>[];
      json['columns'].forEach((v) {
        columns!.add(new Columns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.columns != null) {
      data['columns'] = this.columns!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? emailID;
  String? role;
  String? plant;
  bool? isActive;

  Data({this.name, this.emailID, this.role, this.plant, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    emailID = json['emailID'];
    role = json['role'];
    plant = json['plant'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['emailID'] = this.emailID;
    data['role'] = this.role;
    data['plant'] = this.plant;
    data['isActive'] = this.isActive;
    return data;
  }
}

class Columns {
  String? dataField;
  String? text;

  Columns({this.dataField, this.text});

  Columns.fromJson(Map<String, dynamic> json) {
    dataField = json['dataField'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataField'] = this.dataField;
    data['text'] = this.text;
    return data;
  }
}
