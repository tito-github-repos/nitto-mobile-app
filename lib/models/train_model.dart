// To parse this JSON data, do
//
//     final trainModel = trainModelFromJson(jsonString);

import 'dart:convert';

TrainModel trainModelFromJson(String str) =>
    TrainModel.fromJson(json.decode(str));

String trainModelToJson(TrainModel data) => json.encode(data.toJson());

class TrainModel {
  String status;
  int statusCode;
  List<Datum> data;

  TrainModel({
    required this.status,
    required this.statusCode,
    required this.data,
  });

  factory TrainModel.fromJson(Map<String, dynamic> json) => TrainModel(
        status: json["status"],
        statusCode: json["status_code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String trainId;
  String trainName;

  Datum({
    required this.trainId,
    required this.trainName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        trainId: json["trainId"],
        trainName: json["trainName"],
      );

  Map<String, dynamic> toJson() => {
        "trainId": trainId,
        "trainName": trainName,
      };
}
