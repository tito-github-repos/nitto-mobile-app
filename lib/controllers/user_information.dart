import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nitto_app/controllers/login_controller.dart';

import '../routes/routes.dart';
import '../services/remote_service.dart';
import '../utils/helper.dart';

class UserInformationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  final emailController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final mobileController = TextEditingController().obs;

  final currentPassController = TextEditingController().obs;
  final newPassController = TextEditingController().obs;
  final confirmPassController = TextEditingController().obs;

  RxBool isUserDetails = true.obs;

  RxBool isNameEditable = true.obs;
  RxBool isMobileEditable = true.obs;

  dynamic loginData;

  dynamic loginController;

  var currentPasswordErrorMsg = ''.obs;
  var newPasswordErrorMsg = ''.obs;
  var confirmPasswordErrorMsg = ''.obs;

  var nameErrorMsg = ''.obs;
  var mobileErrorMsg = ''.obs;

  final GlobalKey<FormState> passwordUpdateFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    loginData = GetStorage().read('gs_login_data');
    print("------------> ${loginData}");
    if (loginData != null) {
      emailController.value.text = loginData['emailID'];
      nameController.value.text = loginData['firstName'];
      mobileController.value.text = loginData['mobileNo'];
    }
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  void changeUserDetailsVisibility(val) {
    if (val == 'userDetail') {
      isUserDetails(true);
    } else {
      isUserDetails(false);
    }
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  updateProfile(key) async {
    try {
      var payLoad = key == 'name'
          ? {
              "emailID": emailController.value.text,
              "firstName": nameController.value.text
            }
          : {
              "emailID": emailController.value.text,
              "mobileNo": mobileController.value.text,
              "firstName": nameController.value.text
            };
      print("profile update payload -----> $payLoad");
      var response = await RemoteService().updateProfileService(payLoad);
      print("------------> $response");
      if (response != null) {
        var result = jsonDecode(response.body);
        print("-------------> sss $result");
        if (result['status_code'] == 200) {
          Get.find<LoginController>().login(
              'user_info',
              GetStorage().read('gs_login_username'),
              GetStorage().read('gs_login_password'));
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              Helper().snackBar(result['message']),
            );
        } else {
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              Helper().snackBar('update failed'),
            );
        }

        update();
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar('update failed'),
          );
        update();
      }
    } catch (e) {
      update();
      print("---------catch calling -----> $e");
    }
  }

  updatePassword() async {
    try {
      var payLoad = {
        "emailID": emailController.value.text,
        "password": currentPassController.value.text,
        "newPassword": newPassController.value.text,
        "confirmPassword": confirmPassController.value.text
      };
      print("update password -------> $payLoad");
      var response = await RemoteService().updatePasswordService(payLoad);
      print("service response ---------> $response");
      if (response != null) {
        var result = jsonDecode(response.body);
        print("-----decode-------> $result");
        if (result['status_code'] == 200) {
          GetStorage()
              .write('gs_login_password', confirmPassController.value.text);
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              Helper().snackBar(result['message']),
            );
        } else {
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              Helper().snackBar('update failed'),
            );
        }

        update();
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar('update failed'),
          );
        update();
      }
    } catch (e) {
      update();
      print("---------catch calling -----> $e");
    }
  }

  logout() async {
    try {
      var payLoad = {
        "emailID": GetStorage().read('gs_login_username').toString(),
      };
      print("update password -------> $payLoad");
      var response = await RemoteService().logoutService(payLoad);
      print("service response ---------> $response");
      if (response != null) {
        var result = jsonDecode(response.body);
        print("-----decode-------> $result");
        if (result['status_code'] == 200) {
          GetStorage().write("gs_login_data", null);
          Get.offAllNamed(Routes.login);
        } else {
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              Helper().snackBar('update failed'),
            );
        }

        update();
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar('update failed'),
          );
        update();
      }
    } catch (e) {
      update();
      print("---------catch calling -----> $e");
    }
  }
}
