import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nitto_app/models/user_management_list_model.dart';

import '../models/graph_model.dart';
import '../models/pass_model.dart';
import '../models/plant_model.dart';
import '../models/plant_ts_data.dart';
import '../models/stage_model.dart';
import '../models/train_model.dart';
import '../services/remote_service.dart';
import '../utils/helper.dart';

class UserManagementController extends GetxController {
  PlantModel? plantModel;
  TrainModel? trainModel;
  PassModel? passModel;
  StageModel? stageModel;
  PlantTsData? plantTsData;
  GraphData? graphData;
  UserManagementListModel? userManagementListModel;

  String? plantValue = null;
  String? trainValue = null;
  String? passValue = null;
  String? stageValue = "STAGE-1-PS2T2P1-DC";
  var isLoading = false.obs;
  var isUserExist = false.obs;
  var roledata = ''.obs;
  int id = 1;
  String radioButtonItem = 'ONE';

  TextEditingController datePickerController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  final GlobalKey<FormState> userManagekey = GlobalKey<FormState>();

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

  var roloArr = ['Plant Manager', 'Plant Supervisor', 'Plant Operator'];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserList();
    getPlants();
  }

  userExistCheck() async {
    try {
      var payload = {"emailID": emailController.value.text + '@tito.org.in'};
      var response = await RemoteService().userExistService(payload);
      print("----------> res $response");
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        print("is user exist --------> $decodeRes");
        isUserExist.value = decodeRes['isExist'];
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar('something went wrong'),
          );
        isLoading(false);
      }
    } catch (e) {
      print("-------------> $e");
    }
  }

  assignUser() async {
    try {
      var payload = {
        "userId": GetStorage().read('gs_login_data')['emailID'],
        "plantUniqueId": plantValue,
        "emailID": emailController.value.text + '@tito.org.in',
        "name": nameController.value.text,
        "roleName": roledata.value
      };
      print("assing user payload $payload");
      var response = await RemoteService().assignUser(payload);
      print("----------> res $response");
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        print("decode response data ------> $decodeRes");
        update();
        getUserList();
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar('something went wrong'),
          );
        isLoading(false);
      }
    } catch (e) {
      print("-------------> $e");
    }
  }

  getUserList() async {
    try {
      var payload = {"emailID": "demouser7@tito.org.in"};
      var response = await RemoteService().getUserManagementList(payload);
      print("----------> res $response");
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        userManagementListModel = null;
        userManagementListModel = UserManagementListModel.fromJson(decodeRes);
        update();
      } else {
        userManagementListModel = null;
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar('something went wrong'),
          );
        update();
        isLoading(false);
      }
    } catch (e) {
      userManagementListModel = null;
      update();
      print("-------------> $e");
    }
  }

  getPlants() async {
    try {
      var response = await RemoteService().getPlantService();
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        //print("repos ---------> $decodeRes");
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
