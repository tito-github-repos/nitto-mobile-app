class TrainModel {
  String? _status;
  int? _statusCode;
  List<Data>? _data;

  TrainModel({String? status, int? statusCode, List<Data>? data}) {
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

  TrainModel.fromJson(Map<String, dynamic> json) {
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
  String? _trainId;
  String? _trainName;

  Data({String? trainId, String? trainName}) {
    if (trainId != null) {
      this._trainId = trainId;
    }
    if (trainName != null) {
      this._trainName = trainName;
    }
  }

  String? get trainId => _trainId;
  set trainId(String? trainId) => _trainId = trainId;
  String? get trainName => _trainName;
  set trainName(String? trainName) => _trainName = trainName;

  Data.fromJson(Map<String, dynamic> json) {
    _trainId = json['trainId'];
    _trainName = json['trainName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trainId'] = this._trainId;
    data['trainName'] = this._trainName;
    return data;
  }
}
