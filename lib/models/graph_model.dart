// To parse this JSON data, do
//
//     final graphData = graphDataFromJson(jsonString);

import 'dart:convert';

GraphData graphDataFromJson(dynamic str) =>
    GraphData.fromJson(json.decode(str));

dynamic graphDataToJson(GraphData data) => json.encode(data.toJson());

class GraphData {
  List<Datum> data;
  List<StatisticalDatum> statisticalData;
  List<Cip> cip;

  GraphData({
    required this.data,
    required this.statisticalData,
    required this.cip,
  });

  factory GraphData.fromJson(Map<String, dynamic> json) => GraphData(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        statisticalData: List<StatisticalDatum>.from(
            json["statisticalData"].map((x) => StatisticalDatum.fromJson(x))),
        cip: List<Cip>.from(json["cip"].map((x) => Cip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "statisticalData":
            List<dynamic>.from(statisticalData.map((x) => x.toJson())),
        "cip": List<dynamic>.from(cip.map((x) => x.toJson())),
      };
}

class Cip {
  dynamic value;
  dynamic text;
  dynamic cipClass;

  Cip({
    required this.value,
    required this.text,
    required this.cipClass,
  });

  factory Cip.fromJson(Map<String, dynamic> json) => Cip(
        value: DateTime.parse(json["value"]),
        text: json["text"],
        cipClass: json["class"],
      );

  Map<String, dynamic> toJson() => {
        "value":
            "${value.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}",
        "text": text,
        "class": cipClass,
      };
}

class Datum {
  dynamic name;
  List<ChartDatum> chartData;
  List<Reference> reference;
  List<Cip> cip;
  List<dynamic> color;

  Datum({
    required this.name,
    required this.chartData,
    required this.reference,
    required this.cip,
    required this.color,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        chartData: List<ChartDatum>.from(
            json["chart_data"].map((x) => ChartDatum.fromJson(x))),
        reference: List<Reference>.from(
            json["reference"].map((x) => Reference.fromJson(x))),
        cip: List<Cip>.from(json["cip"].map((x) => Cip.fromJson(x))),
        color: List<dynamic>.from(json["color"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "chart_data": List<dynamic>.from(chartData.map((x) => x.toJson())),
        "reference": List<dynamic>.from(reference.map((x) => x.toJson())),
        "cip": List<dynamic>.from(cip.map((x) => x.toJson())),
        "color": List<dynamic>.from(color.map((x) => x)),
      };
}

class ChartDatum {
  dynamic timeseries;
  dynamic normalizedSaltPassage;
  dynamic linear;
  dynamic normalizedPermeateFlow;
  dynamic normalizedDp;

  ChartDatum({
    required this.timeseries,
    this.normalizedSaltPassage,
    required this.linear,
    this.normalizedPermeateFlow,
    this.normalizedDp,
  });

  factory ChartDatum.fromJson(Map<String, dynamic> json) => ChartDatum(
        timeseries: DateTime.parse(json["timeseries"]),
        normalizedSaltPassage: json["Normalized Salt Passage"]?.toDouble(),
        linear: json["linear"]?.toDouble(),
        normalizedPermeateFlow: json["Normalized Permeate Flow"]?.toDouble(),
        normalizedDp: json["Normalized DP"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "timeseries":
            "${timeseries.year.toString().padLeft(4, '0')}-${timeseries.month.toString().padLeft(2, '0')}-${timeseries.day.toString().padLeft(2, '0')}",
        "Normalized Salt Passage": normalizedSaltPassage,
        "linear": linear,
        "Normalized Permeate Flow": normalizedPermeateFlow,
        "Normalized DP": normalizedDp,
      };
}

class Reference {
  dynamic value;
  dynamic text;
  dynamic position;

  Reference({
    required this.value,
    required this.text,
    required this.position,
  });

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
        value: json["value"],
        text: json["text"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
        "position": position,
      };
}

class StatisticalDatum {
  dynamic mean;
  dynamic min;
  dynamic max;
  dynamic std;

  StatisticalDatum({
    required this.mean,
    required this.min,
    required this.max,
    required this.std,
  });

  factory StatisticalDatum.fromJson(Map<String, dynamic> json) =>
      StatisticalDatum(
        mean: json["mean"]?.toDouble(),
        min: json["min"],
        max: json["max"],
        std: json["std"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "mean": mean,
        "min": min,
        "max": max,
        "std": std,
      };
}
