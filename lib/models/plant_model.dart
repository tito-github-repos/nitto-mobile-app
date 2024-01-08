class PlantModel {
  String? _status;
  int? _statusCode;
  List<Data>? _data;

  PlantModel({String? status, int? statusCode, List<Data>? data}) {
    if (status != null) {
      this._status = status;
    }
    if (statusCode != null) {
      this._statusCode = statusCode;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  int? get statusCode => _statusCode;
  set statusCode(int? statusCode) => _statusCode = statusCode;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  PlantModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['status_code'] = this._statusCode;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? _plantId;
  String? _plantName;

  Data({String? plantId, String? plantName}) {
    if (plantId != null) {
      this._plantId = plantId;
    }
    if (plantName != null) {
      this._plantName = plantName;
    }
  }

  String? get plantId => _plantId;
  set plantId(String? plantId) => _plantId = plantId;
  String? get plantName => _plantName;
  set plantName(String? plantName) => _plantName = plantName;

  Data.fromJson(Map<String, dynamic> json) {
    _plantId = json['plantId'];
    _plantName = json['plantName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plantId'] = this._plantId;
    data['plantName'] = this._plantName;
    return data;
  }
}
