import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/graph_model.dart';
import '../models/pass_model.dart';
import '../models/plant_model.dart';
import '../models/plant_ts_data.dart';
import '../models/stage_model.dart';
import '../models/train_model.dart';
import '../services/remote_service.dart';
import '../utils/helper.dart';

class SetPointsController extends GetxController {
  PlantModel? plantModel;
  TrainModel? trainModel;
  PassModel? passModel;
  StageModel? stageModel;
  PlantTsData? plantTsData;
  GraphData? graphData;

  String? plantValue = null;
  String? trainValue = null;
  String? passValue = null;
  String? stageValue = null;
  var isLoading = false.obs;

  int id = 1;
  String radioButtonItem = 'ONE';

  String errorMessage = '';

  TextEditingController datePickerController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  final GlobalKey<FormState> setFormkey = GlobalKey<FormState>();

  Rx<TextEditingController> npf_highhigh = TextEditingController().obs;
  Rx<TextEditingController> npf_high = TextEditingController().obs;
  Rx<TextEditingController> npf_reference = TextEditingController().obs;
  Rx<TextEditingController> npf_low = TextEditingController().obs;
  Rx<TextEditingController> npf_lowlow = TextEditingController().obs;

  Rx<TextEditingController> nsp_highhigh = TextEditingController().obs;
  Rx<TextEditingController> nsp_high = TextEditingController().obs;
  Rx<TextEditingController> nsp_reference = TextEditingController().obs;
  Rx<TextEditingController> nsp_low = TextEditingController().obs;
  Rx<TextEditingController> nsp_lowlow = TextEditingController().obs;

  Rx<TextEditingController> ndp_highhigh = TextEditingController().obs;
  Rx<TextEditingController> ndp_high = TextEditingController().obs;
  Rx<TextEditingController> ndp_reference = TextEditingController().obs;
  Rx<TextEditingController> ndp_low = TextEditingController().obs;
  Rx<TextEditingController> ndp_lowlow = TextEditingController().obs;

  Rx<TextEditingController> energy_highhigh = TextEditingController().obs;
  Rx<TextEditingController> energy_high = TextEditingController().obs;
  Rx<TextEditingController> energy_reference = TextEditingController().obs;
  Rx<TextEditingController> energy_low = TextEditingController().obs;
  Rx<TextEditingController> energy_lowlow = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setInitialValue();
    getPlants('auto');
    //getSetPoints();
  }

  void setInitialValue() {
    npf_high.value.text = 0.toString();
    npf_highhigh.value.text = 0.toString();
    npf_low.value.text = 0.toString();
    npf_lowlow.value.text = 0.toString();
    npf_reference.value.text = 0.toString();

    nsp_high.value.text = 0.toString();
    nsp_highhigh.value.text = 0.toString();
    nsp_low.value.text = 0.toString();
    nsp_lowlow.value.text = 0.toString();
    nsp_reference.value.text = 0.toString();

    ndp_high.value.text = 0.toString();
    ndp_highhigh.value.text = 0.toString();
    ndp_low.value.text = 0.toString();
    ndp_lowlow.value.text = 0.toString();
    ndp_reference.value.text = 0.toString();

    energy_high.value.text = 0.toString();
    energy_highhigh.value.text = 0.toString();
    energy_low.value.text = 0.toString();
    energy_lowlow.value.text = 0.toString();
    energy_reference.value.text = 0.toString();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }

  getSetPoints() async {
    try {
      var payload = {"stageId": stageValue};
      var response = await RemoteService().getSetPoints(jsonEncode(payload));
      print("get set point response ------------>>> $response");
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        print("decode response data ----------->>> $decodeRes");
        for (var i = 0; i < decodeRes.length; i++) {
          if (decodeRes[i]['parameter'] == 'NPF') {
            npf_high.value.text = decodeRes[i]['high'].toString();
            npf_highhigh.value.text = decodeRes[i]['highhigh'].toString();
            npf_low.value.text = decodeRes[i]['low'].toString();
            npf_lowlow.value.text = decodeRes[i]['lowlow'].toString();
            npf_reference.value.text = decodeRes[i]['reference'].toString();
          } else if (decodeRes[i]['parameter'] == 'NSP') {
            nsp_high.value.text = decodeRes[i]['high'].toString();
            nsp_highhigh.value.text = decodeRes[i]['highhigh'].toString();
            nsp_low.value.text = decodeRes[i]['low'].toString();
            nsp_lowlow.value.text = decodeRes[i]['lowlow'].toString();
            nsp_reference.value.text = decodeRes[i]['reference'].toString();
          } else if (decodeRes[i]['parameter'] == 'NDP') {
            ndp_high.value.text = decodeRes[i]['high'].toString();
            ndp_highhigh.value.text = decodeRes[i]['highhigh'].toString();
            ndp_low.value.text = decodeRes[i]['low'].toString();
            ndp_lowlow.value.text = decodeRes[i]['lowlow'].toString();
            ndp_reference.value.text = decodeRes[i]['reference'].toString();
          } else {
            energy_high.value.text = decodeRes[i]['high'].toString();
            energy_highhigh.value.text = decodeRes[i]['highhigh'].toString();
            energy_low.value.text = decodeRes[i]['low'].toString();
            energy_lowlow.value.text = decodeRes[i]['lowlow'].toString();
            energy_reference.value.text = decodeRes[i]['reference'].toString();
          }
        }
      } else {
        isLoading(false);
      }
    } catch (e) {
      print("----------------> $e");
    }
  }

  updateSetPoint() async {
    try {
      var payload = {
        "stageId": "STAGE-1-Z1I703K",
        "data": [
          {
            "reference": npf_reference.value.text.toString(),
            "high": npf_high.value.text.toString(),
            "highhigh": npf_highhigh.value.text.toString(),
            "low": npf_low.value.text.toString(),
            "lowlow": npf_lowlow.value.text.toString(),
            "parameter": "NPF"
          },
          {
            "reference": nsp_reference.value.text.toString(),
            "high": nsp_high.value.text.toString(),
            "highhigh": nsp_highhigh.value.text.toString(),
            "low": nsp_low.value.text.toString(),
            "lowlow": nsp_lowlow.value.text.toString(),
            "parameter": "NSP"
          },
          {
            "reference": ndp_reference.value.text.toString(),
            "high": ndp_high.value.text.toString(),
            "highhigh": ndp_highhigh.value.text.toString(),
            "low": ndp_low.value.text.toString(),
            "lowlow": ndp_lowlow.value.text.toString(),
            "parameter": "NDP"
          },
          {
            "reference": energy_reference.value.text.toString(),
            "high": energy_high.value.text.toString(),
            "highhigh": energy_highhigh.value.text.toString(),
            "low": energy_low.value.text.toString(),
            "lowlow": energy_lowlow.value.text.toString(),
            "parameter": "Energy"
          }
        ]
      };
      var response =
          await RemoteService().addSetPointService(jsonEncode(payload));
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        if (decodeRes['status_code'] == 200) {
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              Helper().snackBar('Data Updated Successfully'),
            );
          update();
        } else {
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              Helper().snackBar('something went wrong'),
            );
        }
      } else {
        isLoading(false);
      }
    } catch (e) {
      print("---------catch calling -----> $e");
    }
  }

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
        // getGraph();
        getSetPoints();
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
      var response = await RemoteService().getGraphService(stageValue);
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        graphData = GraphData.fromJson(decodeRes);
        update();
      } else {
        isLoading(false);
      }
    } catch (e) {
      print("---------catch calling ---1--> $e");
    }
  }
}
