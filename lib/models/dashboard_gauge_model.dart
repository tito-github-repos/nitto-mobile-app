class dashboardData {
  List<DashboardDatas>? dashboardDatas;
  dynamic defaultStageID;
  dynamic timeseries;

  dashboardData({this.dashboardDatas, this.defaultStageID, this.timeseries});

  dashboardData.fromJson(Map<String, dynamic> json) {
    if (json['dashboardDatas'] != null) {
      dashboardDatas = <DashboardDatas>[];
      json['dashboardDatas'].forEach((v) {
        dashboardDatas!.add(new DashboardDatas.fromJson(v));
      });
    }
    defaultStageID = json['defaultStageID'];
    timeseries = json['timeseries'] != null
        ? new Timeseries.fromJson(json['timeseries'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dashboardDatas != null) {
      data['dashboardDatas'] =
          this.dashboardDatas!.map((v) => v.toJson()).toList();
    }
    data['defaultStageID'] = this.defaultStageID;
    if (this.timeseries != null) {
      data['timeseries'] = this.timeseries!.toJson();
    }
    return data;
  }
}

class DashboardDatas {
  List<GaugeDatas>? gaugeDatas;
  dynamic status;
  dynamic stageUniqueId;
  dynamic stageName;

  DashboardDatas(
      {this.gaugeDatas, this.status, this.stageUniqueId, this.stageName});

  DashboardDatas.fromJson(Map<String, dynamic> json) {
    if (json['gaugeDatas'] != null) {
      gaugeDatas = <GaugeDatas>[];
      json['gaugeDatas'].forEach((v) {
        gaugeDatas!.add(new GaugeDatas.fromJson(v));
      });
    }
    status = json['status'];
    stageUniqueId = json['stageUniqueId'];
    stageName = json['stageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gaugeDatas != null) {
      data['gaugeDatas'] = this.gaugeDatas!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['stageUniqueId'] = this.stageUniqueId;
    data['stageName'] = this.stageName;
    return data;
  }
}

class GaugeDatas {
  dynamic value;
  List<dynamic>? ranges;
  List<dynamic>? colors;
  dynamic max;
  dynamic min;
  dynamic label;

  GaugeDatas(
      {this.value, this.ranges, this.colors, this.max, this.min, this.label});

  GaugeDatas.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    ranges = json['ranges'].cast<int>();
    colors = json['colors'].cast<String>();
    max = json['max'];
    min = json['min'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['ranges'] = this.ranges;
    data['colors'] = this.colors;
    data['max'] = this.max;
    data['min'] = this.min;
    data['label'] = this.label;
    return data;
  }
}

class Timeseries {
  List<Null>? data;
  List<StatisticalData>? statisticalData;
  List<Null>? cip;

  Timeseries({this.data, this.statisticalData, this.cip});

  Timeseries.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Null>[];
      json['data'].forEach((v) {
        data!.add(v);
      });
    }
    if (json['statisticalData'] != null) {
      statisticalData = <StatisticalData>[];
      json['statisticalData'].forEach((v) {
        statisticalData!.add(new StatisticalData.fromJson(v));
      });
    }
    if (json['cip'] != null) {
      cip = <Null>[];
      json['cip'].forEach((v) {
        cip!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v).toList();
    }
    if (this.statisticalData != null) {
      data['statisticalData'] =
          this.statisticalData!.map((v) => v.toJson()).toList();
    }
    if (this.cip != null) {
      data['cip'] = this.cip!.map((v) => v).toList();
    }
    return data;
  }
}

class StatisticalData {
  dynamic mean;
  dynamic min;
  dynamic max;
  dynamic std;

  StatisticalData({this.mean, this.min, this.max, this.std});

  StatisticalData.fromJson(Map<String, dynamic> json) {
    mean = json['mean'];
    min = json['min'];
    max = json['max'];
    std = json['std'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mean'] = this.mean;
    data['min'] = this.min;
    data['max'] = this.max;
    data['std'] = this.std;
    return data;
  }
}
