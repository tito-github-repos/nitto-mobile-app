import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:nitto_app/models/grap_data_model.dart';
import 'package:nitto_app/models/graph_model.dart';
import 'package:nitto_app/models/pass_model.dart';
import 'package:nitto_app/models/plant_model.dart';
import 'package:nitto_app/models/stage_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/train_model.dart';
import '../services/remote_service.dart';

class PlantController extends GetxController {
  PlantModel? plantModel;
  TrainModel? trainModel;
  PassModel? passModel;
  StageModel? stageModel;
  GraphDataModel? graphData;

  RxBool nspIsvisible1 = true.obs;
  RxBool trendIsvisible1 = true.obs;

  RxBool nspIsvisible2 = true.obs;
  RxBool trendIsvisible2 = true.obs;
  RxBool nspIsvisible3 = true.obs;
  RxBool trendIsvisible3 = true.obs;

  // ignore: avoid_init_to_null
  String? plantValue = null;
  String? trainValue = null;
  String? passValue = null;
  String? stageValue = null;

  var isLoading = false.obs;

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  late TooltipBehavior tooltipBehavior;
  late ZoomPanBehavior zoomPanBehavior;
  late TrackballBehavior trackballBehavior;

  Rx<TextEditingController> fromDate = TextEditingController().obs;
  Rx<TextEditingController> toDate = TextEditingController().obs;
  RxInt selectedValue = 5.obs; // Initial selected value

  InAppWebViewController? webViewController;
  var graphUrl = '';

  var fromDateStr = '';
  var toDateStr = '';

  @override
  void onInit() {
    super.onInit();
    trackballBehavior = TrackballBehavior(
        enable: true,
        // Display mode of trackball tooltip
        tooltipDisplayMode: TrackballDisplayMode.floatAllPoints);
    zoomPanBehavior = ZoomPanBehavior(
        enableDoubleTapZooming: true,
        enablePinching: true,
        // Enables the selection zooming
        enableSelectionZooming: true);
    tooltipBehavior = TooltipBehavior(enable: true);
    getPlants('auto');
  }

  Future<void> selectDate(key) async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      var date = DateTime.parse(picked.toString());
      if (key == 'from') {
        fromDateStr = "${date.year}-${date.month}-${date.day}";
        fromDate.value.text = "${date.day}/${date.month}/${date.year}";
      } else {
        toDateStr = "${date.year}-${date.month}-${date.day}";
        toDate.value.text = "${date.day}/${date.month}/${date.year}";
      }
      getGraph();
    }
  }

  void setSelectedValue(int value) {
    DateTime date = DateTime.now();
    var day = 0;
    if (value == 1) {
      day = 1;
    } else if (value == 2) {
      day = 7;
    } else if (value == 3) {
      day = 30;
    } else if (value == 4) {
      day = 180;
    } else if (value == 5) {
      day = 365;
    } else if (value == 6) {
      day = 36525;
    }

    DateTime yesterday = date.subtract(Duration(days: day));
    fromDateStr = "${yesterday.year}-${yesterday.month}-${yesterday.day}";
    toDateStr = "${date.year}-${date.month}-${date.day}";

    fromDate.value.text =
        "${yesterday.day}/${yesterday.month}/${yesterday.year}";
    toDate.value.text = "${date.day}/${date.month}/${date.year}";

    selectedValue.value = value;
    update();
    getGraph();
  }

  void updateMarkerLine(key) {
    if (key == 'nsp') {
      nspIsvisible1.value = !nspIsvisible1.value;
      update();
    } else if (key == 'trend') {
      trendIsvisible1.value = !trendIsvisible1.value;
      update();
    } else if (key == 'nsp1') {
      nspIsvisible2.value = !nspIsvisible2.value;
      update();
    } else if (key == 'trend1') {
      trendIsvisible2.value = !trendIsvisible2.value;
      update();
    } else if (key == 'nsp2') {
      nspIsvisible3.value = !nspIsvisible3.value;
      update();
    } else if (key == 'trend2') {
      trendIsvisible3.value = !trendIsvisible3.value;
      update();
    }
  }

  // var staticDummyData = {
  //   "plants": [
  //     {"plant_name": "Plant 1", "plant_id": "PLANT-1-328"},
  //     {"plant_name": "Plant 2", "plant_id": "PLANT-2-328"},
  //     {"plant_name": "Plant 3", "plant_id": "PLANT-3-328"},
  //     {"plant_name": "Plant 4", "plant_id": "PLANT-4-328"},
  //     {"plant_name": "Plant 5", "plant_id": "PLANT-5-328"}
  //   ]
  // };

  var graphDatad = {
    "data": [
      {
        "chart_data": [
          {
            "timeseries": "2023-01-01",
            "Normalised Salt Passage": 1.49,
            "linear": 1.517
          },
          {
            "timeseries": "2023-02-01",
            "Normalised Salt Passage": 1.48,
            "linear": 1.503
          },
          {
            "timeseries": "2023-03-01",
            "Normalised Salt Passage": 1.59,
            "linear": 1.489
          },
          {
            "timeseries": "2023-04-01",
            "Normalised Salt Passage": 1.33,
            "linear": 1.474
          },
          {
            "timeseries": "2023-05-01",
            "Normalised Salt Passage": 1.15,
            "linear": 1.46
          },
          {
            "timeseries": "2023-06-01",
            "Normalised Salt Passage": 1.59,
            "linear": 1.445
          },
          {
            "timeseries": "2023-07-01",
            "Normalised Salt Passage": 1.64,
            "linear": 1.431
          },
          {
            "timeseries": "2023-08-01",
            "Normalised Salt Passage": 1.82,
            "linear": 1.417
          },
          {
            "timeseries": "2023-09-01",
            "Normalised Salt Passage": 1.33,
            "linear": 1.402
          },
          {
            "timeseries": "2023-10-01",
            "Normalised Salt Passage": 1.3,
            "linear": 1.388
          },
          {
            "timeseries": "2023-11-01",
            "Normalised Salt Passage": 1.18,
            "linear": 1.374
          }
        ],
        "reference": [
          {"value": 1.18, "text": "RefNSP", "position": "end"}
        ],
        "cip": [
          {"value": "2023-05-01", "text": "CIP", "class": "test"}
        ],
        "name": "Norm. Salt Passage (%)",
        "color": ["#38419D", "#BF3131"]
      },
      {
        "chart_data": [
          {
            "timeseries": "2023-01-01",
            "Normalised Salt Passage": 1.49,
            "linear": 1.517
          },
          {
            "timeseries": "2023-02-01",
            "Normalised Salt Passage": 1.48,
            "linear": 1.503
          },
          {
            "timeseries": "2023-03-01",
            "Normalised Salt Passage": 1.59,
            "linear": 1.489
          }
        ],
        "reference": [
          {"value": 21.4, "text": "RefNPF", "position": "end"}
        ],
        "cip": [
          {"value": "2023-05-01", "text": "CIP", "class": "test"}
        ],
        "name": "Norm. Perm. Flow (m³/hr)",
        "color": ["#E36414", "#1F8A70"]
      },
      {
        "chart_data": [
          {"timeseries": "2023-01-01", "Normalized DP": 1.49, "linear": 1.517},
          {"timeseries": "2023-02-01", "Normalized DP": 1.48, "linear": 1.503},
          {"timeseries": "2023-03-01", "Normalized DP": 1.59, "linear": 1.489},
          {"timeseries": "2023-04-01", "Normalized DP": 1.33, "linear": 1.474},
          {"timeseries": "2023-05-01", "Normalized DP": 1.15, "linear": 1.46},
          {"timeseries": "2023-06-01", "Normalized DP": 1.59, "linear": 1.445},
          {"timeseries": "2023-07-01", "Normalized DP": 1.64, "linear": 1.431},
          {"timeseries": "2023-08-01", "Normalized DP": 1.82, "linear": 1.417},
          {"timeseries": "2023-09-01", "Normalized DP": 1.33, "linear": 1.402},
          {"timeseries": "2023-10-01", "Normalized DP": 1.3, "linear": 1.388},
          {"timeseries": "2023-11-01", "Normalized DP": 1.18, "linear": 1.374}
        ],
        "reference": [
          {"value": 1.01, "text": "RefNDP", "position": "end"}
        ],
        "cip": [
          {"value": "2023-05-01", "text": "CIP", "class": "test"}
        ],
        "name": "Norm. DP (bar)",
        "color": ["#B06161", "#2B2A4C"]
      }
    ],
    "statisticalData": [
      {
        "mean": 1.445,
        "min": "1.15 (01-05-2023)",
        "max": "1.82 (01-08-2023)",
        "std": 0.043
      },
      {
        "mean": 21.274,
        "min": "18.36 (01-05-2023)",
        "max": "24.38 (01-01-2023)",
        "std": 2.823
      },
      {
        "mean": 0.546,
        "min": "0.24 (01-01-2023)",
        "max": "1.11 (01-10-2023)",
        "std": 0.115
      }
    ],
    "cip": [
      {"value": "2023-05-01", "text": "CIP", "class": "test"}
    ]
  };

  getPlants(key) async {
    try {
      var response = await RemoteService().getPlantService();
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        //print("repos ---------> $decodeRes");g
        plantModel = PlantModel.fromJson(decodeRes);
        trainModel = null;
        passModel = null;
        stageModel = null;
        if (key == 'auto' && plantModel!.data!.isNotEmpty) {
          plantValue = plantModel!.data![0].plantId;
          getTrain('auto');
        }
        update();
      } else {
        plantModel = null;
        trainModel = null;
        passModel = null;
        stageModel = null;
        isLoading(false);
        update();
      }
    } catch (e) {
      plantModel = null;
      trainModel = null;
      passModel = null;
      stageModel = null;
      isLoading(false);
      update();
      print("---------catch calling -----> $e");
    }
  }

  getTrain(key) async {
    try {
      print("plant value -------->>>>> $plantValue");
      var response = await RemoteService().getTrainService(plantValue);
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        trainModel = TrainModel.fromJson(decodeRes);
        passModel = null;
        stageModel = null;
        if (trainModel!.data.isNotEmpty) {
          trainValue = trainModel!.data[0].trainId;
          getPass(key);
        }

        update();
      } else {
        trainModel = null;
        passModel = null;
        stageModel = null;
        isLoading(false);
        update();
      }
    } catch (e) {
      trainModel = null;
      passModel = null;
      stageModel = null;
      update();
      print("---------catch calling -----> $e");
    }
  }

  getPass(key) async {
    try {
      var response = await RemoteService().getPassService(trainValue);
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        passModel = PassModel.fromJson(decodeRes);
        stageModel = null;
        if (passModel!.data!.isNotEmpty) {
          passValue = passModel!.data![0].passId;
          getStage(key);
        }
        update();
      } else {
        passModel = null;
        stageModel = null;
        isLoading(false);
        update();
      }
    } catch (e) {
      passModel = null;
      stageModel = null;
      isLoading(false);
      update();
      print("---------catch calling -----> $e");
    }
  }

  getStage(key) async {
    try {
      var response = await RemoteService().getStageService(passValue);
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        stageModel = StageModel.fromJson(decodeRes);
        if (stageModel!.data!.isNotEmpty) {}
        stageValue = stageModel!.data![0].stageId;
        getGraph();
        setSelectedValue(5);
        update();
      } else {
        stageModel = null;
        isLoading(false);
        update();
      }
    } catch (e) {
      stageModel = null;
      isLoading(false);
      update();
      print("---------catch calling -----> $e");
    }
  }

  getGraph() async {
    try {
      graphUrl =
          'https://hydrasave.com/account/login-help?stageId=$stageValue&fromDate=$fromDateStr&toDate=$toDateStr';
      print("plant details graph data url -------------> $graphUrl");
      webViewController?.loadUrl(
          urlRequest: URLRequest(url: Uri.parse(graphUrl)));
      //webViewController!.reload();
      update();
      var postData = {
        "stageId": stageValue.toString(),
        "from": fromDateStr,
        "to": toDateStr
      };
      print("---------> $postData");
      var response = await RemoteService().getGraphService(postData);
      print("------------> $response");
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        print("------------>decode data  $decodeRes");
        graphData = GraphDataModel.fromJson(decodeRes);
        if (graphData!.data!.isEmpty) {
          graphData = null;
        }
        print("----------> $decodeRes");
        isLoading(false);
        update();
      } else {
        graphData = null;
        isLoading(false);
        update();
      }
    } catch (e) {
      graphData = null;
      isLoading(false);
      update();
      print("---------> catch ----> $e");
      print("---------catch calling ---1--> $e");
    }
  }
}
