import 'dart:convert';

import 'package:get/get.dart';
import 'package:nitto_app/models/graph_model.dart';
import 'package:nitto_app/models/pass_model.dart';
import 'package:nitto_app/models/plant_model.dart';
import 'package:nitto_app/models/plant_ts_data.dart';
import 'package:nitto_app/models/stage_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/train_model.dart';
import '../services/remote_service.dart';

class PlantController extends GetxController {
  PlantModel? plantModel;
  TrainModel? trainModel;
  PassModel? passModel;
  StageModel? stageModel;
  PlantTsData? plantTsData;
  GraphData? graphData;

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
  String? stageValue = "STAGE-1-PS2T2P1-DC";
  var isLoading = false.obs;

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  late TooltipBehavior tooltipBehavior;
  late ZoomPanBehavior zoomPanBehavior;
  late TrackballBehavior trackballBehavior;

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
    getPlants();
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

  var staticDummyData = {
    "plants": [
      {"plant_name": "Plant 1", "plant_id": "PLANT-1-328"},
      {"plant_name": "Plant 2", "plant_id": "PLANT-2-328"},
      {"plant_name": "Plant 3", "plant_id": "PLANT-3-328"},
      {"plant_name": "Plant 4", "plant_id": "PLANT-4-328"},
      {"plant_name": "Plant 5", "plant_id": "PLANT-5-328"}
    ]
  };

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

  getPlants() async {
    try {
      var response = await RemoteService().getPlantService();
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        //print("repos ---------> $decodeRes");g
        plantModel = PlantModel.fromJson(decodeRes);
        trainModel = null;
        passModel = null;
        stageModel = null;
        update();
      } else {
        isLoading(false);
      }
    } catch (e) {
      print("---------catch calling -----> $e");
    }
  }

  getTrain() async {
    try {
      var response = await RemoteService().getTrainService(plantValue);
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        print("----------> $decodeRes");
        trainModel = TrainModel.fromJson(decodeRes);
        passModel = null;
        stageModel = null;
        update();
      } else {
        isLoading(false);
      }
    } catch (e) {
      print("---------catch calling -----> $e");
    }
  }

  getPass() async {
    try {
      var response = await RemoteService().getPassService(trainValue);
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        print("----------> $decodeRes");
        passModel = PassModel.fromJson(decodeRes);
        stageModel = null;
        update();
      } else {
        isLoading(false);
      }
    } catch (e) {
      print("---------catch calling -----> $e");
    }
  }

  getStage() async {
    try {
      var response = await RemoteService().getStageService(passValue);
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        print("-------hhh---> $decodeRes");
        stageModel = StageModel.fromJson(decodeRes);
        update();
        getGraph();
      } else {
        isLoading(false);
      }
    } catch (e) {
      print("---------catch calling -----> $e");
    }
  }

  getGraph() async {
    try {
      var response = await RemoteService().getGraphService(stageValue);
      print("------------> $response");
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        graphData = GraphData.fromJson(decodeRes);
        print("----------> $decodeRes");
        update();
      } else {
        isLoading(false);
      }
    } catch (e) {
      print("---------catch calling ---1--> $e");
    }
  }
}
