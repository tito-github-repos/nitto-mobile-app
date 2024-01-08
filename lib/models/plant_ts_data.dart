class PlantTsData {
  List<Data>? _data;
  List<StatisticalData>? _statisticalData;
  List<Null>? _cip;

  PlantTsData(
      {List<Data>? data,
      List<StatisticalData>? statisticalData,
      List<Null>? cip}) {
    if (data != null) {
      this._data = data;
    }
    if (statisticalData != null) {
      this._statisticalData = statisticalData;
    }
    if (cip != null) {
      this._cip = cip;
    }
  }

  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;
  List<StatisticalData>? get statisticalData => _statisticalData;
  set statisticalData(List<StatisticalData>? statisticalData) =>
      _statisticalData = statisticalData;
  List<Null>? get cip => _cip;
  set cip(List<Null>? cip) => _cip = cip;

  PlantTsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
    if (json['statisticalData'] != null) {
      _statisticalData = <StatisticalData>[];
      json['statisticalData'].forEach((v) {
        _statisticalData!.add(new StatisticalData.fromJson(v));
      });
    }
    if (json['cip'] != null) {
      _cip = <Null>[];
      json['cip'].forEach((v) {
        _cip!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    if (this._statisticalData != null) {
      data['statisticalData'] =
          this._statisticalData!.map((v) => v.toJson()).toList();
    }
    if (this._cip != null) {
      data['cip'] = this._cip!.map((v) => v).toList();
    }
    return data;
  }
}

class Data {
  List<double>? _normalisedSaltPassage;
  List<double>? _linear;
  List<String>? _timeseries;
  List<Reference>? _reference;
  List<Null>? _cip;
  String? _name;
  List<String>? _color;
  List<int>? _normalizedPermeateFlow;
  List<double>? _normalizedDP;

  Data(
      {List<double>? normalisedSaltPassage,
      List<double>? linear,
      List<String>? timeseries,
      List<Reference>? reference,
      List<Null>? cip,
      String? name,
      List<String>? color,
      List<int>? normalizedPermeateFlow,
      List<double>? normalizedDP}) {
    if (normalisedSaltPassage != null) {
      this._normalisedSaltPassage = normalisedSaltPassage;
    }
    if (linear != null) {
      this._linear = linear;
    }
    if (timeseries != null) {
      this._timeseries = timeseries;
    }
    if (reference != null) {
      this._reference = reference;
    }
    if (cip != null) {
      this._cip = cip;
    }
    if (name != null) {
      this._name = name;
    }
    if (color != null) {
      this._color = color;
    }
    if (normalizedPermeateFlow != null) {
      this._normalizedPermeateFlow = normalizedPermeateFlow;
    }
    if (normalizedDP != null) {
      this._normalizedDP = normalizedDP;
    }
  }

  List<double>? get normalisedSaltPassage => _normalisedSaltPassage;
  set normalisedSaltPassage(List<double>? normalisedSaltPassage) =>
      _normalisedSaltPassage = normalisedSaltPassage;
  List<double>? get linear => _linear;
  set linear(List<double>? linear) => _linear = linear;
  List<String>? get timeseries => _timeseries;
  set timeseries(List<String>? timeseries) => _timeseries = timeseries;
  List<Reference>? get reference => _reference;
  set reference(List<Reference>? reference) => _reference = reference;
  List<Null>? get cip => _cip;
  set cip(List<Null>? cip) => _cip = cip;
  String? get name => _name;
  set name(String? name) => _name = name;
  List<String>? get color => _color;
  set color(List<String>? color) => _color = color;
  List<int>? get normalizedPermeateFlow => _normalizedPermeateFlow;
  set normalizedPermeateFlow(List<int>? normalizedPermeateFlow) =>
      _normalizedPermeateFlow = normalizedPermeateFlow;
  List<double>? get normalizedDP => _normalizedDP;
  set normalizedDP(List<double>? normalizedDP) => _normalizedDP = normalizedDP;

  Data.fromJson(Map<String, dynamic> json) {
    _normalisedSaltPassage = json['Normalised Salt Passage'].cast<double>();
    _linear = json['linear'].cast<double>();
    _timeseries = json['timeseries'].cast<String>();
    if (json['reference'] != null) {
      _reference = <Reference>[];
      json['reference'].forEach((v) {
        _reference!.add(new Reference.fromJson(v));
      });
    }
    if (json['cip'] != null) {
      _cip = <Null>[];
      json['cip'].forEach((v) {
        _cip!.add(v);
      });
    }
    _name = json['name'];
    _color = json['color'].cast<String>();
    _normalizedPermeateFlow = json['Normalized Permeate Flow'].cast<int>();
    _normalizedDP = json['Normalized DP'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Normalised Salt Passage'] = this._normalisedSaltPassage;
    data['linear'] = this._linear;
    data['timeseries'] = this._timeseries;
    if (this._reference != null) {
      data['reference'] = this._reference!.map((v) => v.toJson()).toList();
    }
    if (this._cip != null) {
      data['cip'] = this._cip!.map((v) => v).toList();
    }
    data['name'] = this._name;
    data['color'] = this._color;
    data['Normalized Permeate Flow'] = this._normalizedPermeateFlow;
    data['Normalized DP'] = this._normalizedDP;
    return data;
  }
}

class Reference {
  int? _value;
  String? _text;
  String? _position;

  Reference({int? value, String? text, String? position}) {
    if (value != null) {
      this._value = value;
    }
    if (text != null) {
      this._text = text;
    }
    if (position != null) {
      this._position = position;
    }
  }

  int? get value => _value;
  set value(int? value) => _value = value;
  String? get text => _text;
  set text(String? text) => _text = text;
  String? get position => _position;
  set position(String? position) => _position = position;

  Reference.fromJson(Map<String, dynamic> json) {
    _value = json['value'];
    _text = json['text'];
    _position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this._value;
    data['text'] = this._text;
    data['position'] = this._position;
    return data;
  }
}

class StatisticalData {
  double? _mean;
  double? _min;
  double? _max;
  double? _std;

  StatisticalData({double? mean, double? min, double? max, double? std}) {
    if (mean != null) {
      this._mean = mean;
    }
    if (min != null) {
      this._min = min;
    }
    if (max != null) {
      this._max = max;
    }
    if (std != null) {
      this._std = std;
    }
  }

  double? get mean => _mean;
  set mean(double? mean) => _mean = mean;
  double? get min => _min;
  set min(double? min) => _min = min;
  double? get max => _max;
  set max(double? max) => _max = max;
  double? get std => _std;
  set std(double? std) => _std = std;

  StatisticalData.fromJson(Map<String, dynamic> json) {
    _mean = json['mean'];
    _min = json['min'];
    _max = json['max'];
    _std = json['std'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mean'] = this._mean;
    data['min'] = this._min;
    data['max'] = this._max;
    data['std'] = this._std;
    return data;
  }
}
