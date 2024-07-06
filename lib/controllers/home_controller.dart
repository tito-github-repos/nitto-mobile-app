import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:nitto_app/models/grap_data_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/graph_model.dart';
import '../models/pass_model.dart';
import '../models/plant_model.dart';
import '../models/stage_model.dart';
import '../models/train_model.dart';
import '../services/remote_service.dart';
import '../utils/helper.dart';

class HomeConroller extends GetxController {
  List<String> plan = <String>["Demo Plant One"];
  List<String> train = <String>['Train 1'];
  List<String> pass = <String>["Pass 1"];
  List<String> stage = <String>['Stage 1'];
  List<String> noDataDropdown = <String>["No Data Found", "choose"];

  List<String> roleArr = <String>[
    'Plant Manager',
    'Plant Supervisor',
    'Plant Operator'
  ];

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  String? dropdownValue;
  String? dropdownValue1;
  String? dropdownValue2;
  String? dropdownValue3;

  PlantModel? plantModel;
  TrainModel? trainModel;
  PassModel? passModel;
  StageModel? stageModel;
  GraphDataModel? graphData;
  String? plantValue = null;
  String? trainValue = null;
  String? passValue = null;
  String? stageValue = null;

  var isLoading = false.obs;

  RxBool nspIsvisible1 = true.obs;
  RxBool trendIsvisible1 = true.obs;

  RxBool nspIsvisible2 = true.obs;
  RxBool trendIsvisible2 = true.obs;
  RxBool nspIsvisible3 = true.obs;
  RxBool trendIsvisible3 = true.obs;

  late TooltipBehavior tooltipBehavior;
  late ZoomPanBehavior zoomPanBehavior;
  late TrackballBehavior trackballBehavior;

  var fromDateStr = '';
  var toDateStr = '';

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  Rx<TextEditingController> fromDate = TextEditingController().obs;
  Rx<TextEditingController> toDate = TextEditingController().obs;
  RxInt selectedValue = 3.obs; // Initial selected value

  InAppWebViewController? webViewController;
  var graphUrl = '';

  var responseee = {
    "status": "OK",
    "status_code": 200,
    "data": [
      {"trainId": "TRAIN-1-NRI4AZ7", "trainName": "Train 1"}
    ]
  };

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
    dropdownValue = plan.first;
    dropdownValue1 = train.first;
    dropdownValue2 = pass.first;
    dropdownValue3 = stage.first;
    getPlants('auto');
  }

  void setSelectedValue(int value) {
    DateTime date = DateTime.now();
    var day = 0;
    if (value == 1) {
      day = 1;
    } else if (value == 2) {
      day = 7;
    } else {
      day = 30;
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

  Future<void> selectDate(key) async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      var date = DateTime.parse(picked.toString());
      if (key == 'from') {
        fromDate.value.text = "${date.year}-${date.month}-${date.day}";
      } else {
        toDate.value.text = "${date.year}-${date.month}-${date.day}";
      }
      getGraph();
    }
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

  getPlants(key) async {
    try {
      var response = await RemoteService().getPlantService();
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        plantModel = PlantModel.fromJson(decodeRes);
        if (key == 'auto') {
          plantValue = plantModel!.data![0].plantId;
          //getTrain('auto');
        }
        getTrain(key);
        update();
      } else {
        plantModel = null;
        isLoading(false);
        update();
      }
    } catch (e) {
      plantModel = null;
      isLoading(false);
      update();
      print("---------catch calling plants-----> $e");
    }
  }

  getTrain(key) async {
    try {
      print("train key --------->>> $key");
      print("plant value --------->>> $plantValue");
      var response = await RemoteService().getTrainService(plantValue);
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        print("response data ----------->> $decodeRes");
        trainModel = null;
        trainValue = '';
        trainModel = TrainModel.fromJson(decodeRes);
        if (trainModel!.data.isNotEmpty) {
          trainValue = trainModel!.data[0].trainId;
        }
        getPass(key);
        update();
      } else {
        trainModel = null;
        isLoading(false);
        update();
      }
    } catch (e) {
      trainModel = null;
      update();
      print("---------catch calling train-----> $e");
    }
  }

  getGague(key) async {
    try {
      var response = await RemoteService().getTrainService(plantValue);
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        trainModel = TrainModel.fromJson(decodeRes);
        passModel = null;
        stageModel = null;
        if (key == 'auto') {
          trainValue = trainModel!.data![0].trainId;
          getPass('auto');
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
        passModel = null;
        passValue = '';
        passModel = PassModel.fromJson(decodeRes);
        stageModel = null;
        if (key == 'auto') {
          passValue = passModel!.data![0].passId;
          getStage('auto');
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
        if (key == 'auto') {
          stageValue = stageModel!.data![0].stageId;
          print("----------> plant controller ----> $stageValue");
          //getGraph();
          setSelectedValue(3);
        }
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
      print("dashboard graph data url -------------> $graphUrl");
      webViewController?.loadUrl(
          urlRequest: URLRequest(url: Uri.parse(graphUrl)));
      //webViewController!.reload();
      update();
      var postData = {
        "stageId": stageValue,
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
      print("catch calling1111 ---------->>> $e");
    }
  }

  getUserList() async {
    try {
      var payload = {"trainId": trainValue};
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
