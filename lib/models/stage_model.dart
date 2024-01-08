class StageModel {
  String? _status;
  int? _statusCode;
  List<Data>? _data;

  StageModel({String? status, int? statusCode, List<Data>? data}) {
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

  StageModel.fromJson(Map<String, dynamic> json) {
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
  String? _stageId;
  String? _stageName;

  Data({String? stageId, String? stageName}) {
    if (stageId != null) {
      this._stageId = stageId;
    }
    if (stageName != null) {
      this._stageName = stageName;
    }
  }

  String? get stageId => _stageId;
  set stageId(String? stageId) => _stageId = stageId;
  String? get stageName => _stageName;
  set stageName(String? stageName) => _stageName = stageName;

  Data.fromJson(Map<String, dynamic> json) {
    _stageId = json['stageId'];
    _stageName = json['stageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stageId'] = this._stageId;
    data['stageName'] = this._stageName;
    return data;
  }
}
