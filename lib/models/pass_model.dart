class PassModel {
  String? _status;
  int? _statusCode;
  List<Data>? _data;

  PassModel({String? status, int? statusCode, List<Data>? data}) {
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

  PassModel.fromJson(Map<String, dynamic> json) {
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
  String? _passId;
  String? _passName;

  Data({String? passId, String? passName}) {
    if (passId != null) {
      this._passId = passId;
    }
    if (passName != null) {
      this._passName = passName;
    }
  }

  String? get passId => _passId;
  set passId(String? passId) => _passId = passId;
  String? get passName => _passName;
  set passName(String? passName) => _passName = passName;

  Data.fromJson(Map<String, dynamic> json) {
    _passId = json['passId'];
    _passName = json['passName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['passId'] = this._passId;
    data['passName'] = this._passName;
    return data;
  }
}
