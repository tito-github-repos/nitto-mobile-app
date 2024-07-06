import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nitto_app/controllers/home_controller.dart';
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
  var homeController = Get.put(HomeConroller());
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
  var btnEnable = false.obs;
  var roledata = ''.obs;
  int id = 1;
  var textFormFieldHeight = 40.0;
  String radioButtonItem = 'ONE';

  TextEditingController datePickerController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  final GlobalKey<FormState> userManagekey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormBuilderState>();

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

  List<String> roleArr = <String>[
    'Plant Manager',
    'Plant Supervisor',
    'Plant Operator'
  ];

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  var nameErrorMsg = ''.obs;
  var emailErrorMsg = ''.obs;

  String? dropdownValue;

  bool isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    roledata.value = roleArr.first;
    dropdownValue = roleArr.first;
    getUserList();
    getPlants('auto');
    update();
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
        btnEnable(true);
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
        "plantUniqueId": homeController.plantValue,
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
        nameController.value.clear();
        emailController.value.clear();
        btnEnable(false);
        isUserExist(false);
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

  userAccess(emailId, plant, value) async {
    try {
      var payload = {
        "emailID": emailId,
        "isActive": value,
        "plantUniqueId": plant
      };
      print("assing user payload $payload");
      var response = await RemoteService().userAcessService(payload);
      print("----------> ress $response");
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar(value == true
                ? 'User has been activated Successfully.'
                : 'User has been de-activated Successfully.'),
          );
        print("decode response data ------> $decodeRes");
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
      var payload = {"emailID": GetStorage().read('gs_login_data')['emailID']};
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

  getPlants(key) async {
    try {
      var response = await RemoteService().getPlantService();
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        //print("repos ---------> $decodeRes");
        plantModel = PlantModel.fromJson(decodeRes);
        if (key == 'auto') {
          plantValue = plantModel!.data![0].plantId;
        }
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
