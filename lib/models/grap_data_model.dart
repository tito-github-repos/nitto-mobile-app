// To parse this JSON data, do
//
//     final graphDataModel = graphDataModelFromJson(jsonString);

import 'dart:convert';

GraphDataModel graphDataModelFromJson(String str) =>
    GraphDataModel.fromJson(json.decode(str));

String graphDataModelToJson(GraphDataModel data) => json.encode(data.toJson());

class GraphDataModel {
  List<Datum>? data;
  List<StatisticalDatum>? statisticalData;
  List<Cip>? cip;

  GraphDataModel({
    this.data,
    this.statisticalData,
    this.cip,
  });

  factory GraphDataModel.fromJson(Map<String, dynamic> json) => GraphDataModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        statisticalData: json["statisticalData"] == null
            ? []
            : List<StatisticalDatum>.from(json["statisticalData"]!
                .map((x) => StatisticalDatum.fromJson(x))),
        cip: json["cip"] == null
            ? []
            : List<Cip>.from(json["cip"]!.map((x) => Cip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "statisticalData": statisticalData == null
            ? []
            : List<dynamic>.from(statisticalData!.map((x) => x.toJson())),
        "cip":
            cip == null ? [] : List<dynamic>.from(cip!.map((x) => x.toJson())),
      };
}

class Cip {
  DateTime? value;
  String? text;
  String? cipClass;

  Cip({
    this.value,
    this.text,
    this.cipClass,
  });

  factory Cip.fromJson(Map<String, dynamic> json) => Cip(
        value: json["value"] == null ? null : DateTime.parse(json["value"]),
        text: json["text"],
        cipClass: json["class"],
      );

  Map<String, dynamic> toJson() => {
        "value": value?.toIso8601String(),
        "text": text,
        "class": cipClass,
      };
}

class Datum {
  List<double>? normalisedSaltPassage;
  List<double>? linear;
  List<DateTime>? timeseries;
  List<dynamic>? reference;
  List<Cip>? cip;
  String? name;
  List<String>? color;
  List<double>? normalizedPermeateFlow;
  List<double>? normalizedDp;

  Datum({
    this.normalisedSaltPassage,
    this.linear,
    this.timeseries,
    this.reference,
    this.cip,
    this.name,
    this.color,
    this.normalizedPermeateFlow,
    this.normalizedDp,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        normalisedSaltPassage: json["Normalised Salt Passage"] == null
            ? []
            : List<double>.from(
                json["Normalised Salt Passage"]!.map((x) => x?.toDouble())),
        linear: json["linear"] == null
            ? []
            : List<double>.from(json["linear"]!.map((x) => x?.toDouble())),
        timeseries: json["timeseries"] == null
            ? []
            : List<DateTime>.from(
                json["timeseries"]!.map((x) => DateTime.parse(x))),
        reference: json["reference"] == null
            ? []
            : List<dynamic>.from(json["reference"]!.map((x) => x)),
        cip: json["cip"] == null
            ? []
            : List<Cip>.from(json["cip"]!.map((x) => Cip.fromJson(x))),
        name: json["name"],
        color: json["color"] == null
            ? []
            : List<String>.from(json["color"]!.map((x) => x)),
        normalizedPermeateFlow: json["Normalized Permeate Flow"] == null
            ? []
            : List<double>.from(
                json["Normalized Permeate Flow"]!.map((x) => x?.toDouble())),
        normalizedDp: json["Normalized DP"] == null
            ? []
            : List<double>.from(
                json["Normalized DP"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "Normalised Salt Passage": normalisedSaltPassage == null
            ? []
            : List<dynamic>.from(normalisedSaltPassage!.map((x) => x)),
        "linear":
            linear == null ? [] : List<dynamic>.from(linear!.map((x) => x)),
        "timeseries": timeseries == null
            ? []
            : List<dynamic>.from(timeseries!.map((x) => x.toIso8601String())),
        "reference": reference == null
            ? []
            : List<dynamic>.from(reference!.map((x) => x)),
        "cip":
            cip == null ? [] : List<dynamic>.from(cip!.map((x) => x.toJson())),
        "name": name,
        "color": color == null ? [] : List<dynamic>.from(color!.map((x) => x)),
        "Normalized Permeate Flow": normalizedPermeateFlow == null
            ? []
            : List<dynamic>.from(normalizedPermeateFlow!.map((x) => x)),
        "Normalized DP": normalizedDp == null
            ? []
            : List<dynamic>.from(normalizedDp!.map((x) => x)),
      };
}

class StatisticalDatum {
  double? mean;
  String? min;
  String? max;

  StatisticalDatum({
    this.mean,
    this.min,
    this.max,
  });

  factory StatisticalDatum.fromJson(Map<String, dynamic> json) =>
      StatisticalDatum(
        mean: json["mean"]?.toDouble(),
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "mean": mean,
        "min": min,
        "max": max,
      };
}
