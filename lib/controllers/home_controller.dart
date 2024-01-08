import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../services/remote_service.dart';
import '../utils/helper.dart';

class HomeConroller extends GetxController {
  List<String> plan = <String>["Demo Plant One"];
  List<String> train = <String>['Train 1'];
  List<String> pass = <String>["Pass 1"];
  List<String> stage = <String>['Stage 1'];
  String? dropdownValue;
  String? dropdownValue1;
  String? dropdownValue2;
  String? dropdownValue3;

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  TooltipBehavior? tooltipBehavior;

  @override
  void onInit() {
    super.onInit();
    dropdownValue = plan.first;
    dropdownValue1 = train.first;
    dropdownValue2 = pass.first;
    dropdownValue3 = stage.first;
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  getUserList() async {
    try {
      var payload = {"trainId": "TRAIN-1-9JV2ISZ"};
      var response = await RemoteService().getUserManagementList(payload);
      print("----------> res $response");
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        print("decode data ---------> $decodeRes");
        update();
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar('something went wrong'),
          );
        update();
      }
    } catch (e) {
      update();
      print("-------------> $e");
    }
  }
}
