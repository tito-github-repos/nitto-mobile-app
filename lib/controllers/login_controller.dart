import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/routes.dart';
import '../services/remote_service.dart';
import '../utils/helper.dart';
import 'user_information.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final loginIdController = TextEditingController().obs;
  final loginPassController = TextEditingController().obs;

  var loginIdErrMsg = ''.obs;
  var usernameErrorMsg = ''.obs;
  var passwordErrorMsg = ''.obs;

  var isLoading = false.obs;
  var passObscure = true.obs;
  var isExist = false.obs;
  var isNitto = false.obs;
  var isCompetitor = false.obs;
  var isWebmail = false.obs;
  var isValidMail = false.obs;

  var webMail = ['gmail', 'yahoo', 'outlook', 'hotmail', 'live', 'bing'];

  dynamic userInformation;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userInformation = Get.put(UserInformationController());
  }

  bool isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  checkUser() async {
    try {
      var userId = loginIdController.value.text;
      //var password = loginPassController.value.text;

      var start = '@';
      var end = '.';

      final startIndex = userId.indexOf(start);
      final endIndex = userId.indexOf(end, startIndex + start.length);
      var validationStr = userId.substring(startIndex + start.length, endIndex);

      //var isValidEmail = isEmailValid(loginIdController.value.text);
      if (validationStr.toLowerCase() == 'nitto') {
        loginIdErrMsg.value = 'Please contact system administrator';
        // ScaffoldMessenger.of(Get.context!)
        //   ..hideCurrentSnackBar()
        //   ..showSnackBar(
        //     Helper().snackBar('Please contact system administrator'),
        //   );
      } else if (webMail.contains(validationStr.toLowerCase())) {
        // showDialog<void>(
        //   context: Get.context!,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       backgroundColor: AppColors.white,
        //       title: const Text('Webmail Warning'),
        //       content: const Text(
        //           "You have entered a Webmail, which will take further processing from the Sales side Yes No to gain access to the application. Do you want to continue?"),
        //       actions: <Widget>[
        //         TextButton(
        //           child: const Text('Yes'),
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //         ),
        //         TextButton(
        //           child: const Text('No'),
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //         ),
        //       ],
        //     );
        //   },
        // );
      } else {
        // loginIdErrMsg.value =
        //     'Please contact Nitto-Hydranautics Regional Sales';
        // ScaffoldMessenger.of(Get.context!)
        //   ..hideCurrentSnackBar()
        //   ..showSnackBar(
        //     Helper()
        //         .snackBar('Please contact Nitto-Hydranautics Regional Sales'),
        //   );
      }

      var response =
          await RemoteService().checkUser(loginIdController.value.text);
      var decodeRes = jsonDecode(response.body);
      print("login response --------> $decodeRes");
      if (decodeRes['status_code'] == 200) {
        isExist.value = decodeRes['isExisting'];
        isNitto.value = decodeRes['isNitto'];
        isCompetitor.value = decodeRes['isCompetitor'];
        isWebmail.value = decodeRes['isWebmail'];
        if (isExist.value == false) {
          passwordErrorMsg.value = '';
          isValidMail(true);
        } else {
          isValidMail(false);
        }
        isLoading(false);
      } else {
        isExist.value = decodeRes['isExisting'];
        isNitto.value = decodeRes['isNitto'];
        isCompetitor.value = decodeRes['isCompetitor'];
        isWebmail.value = decodeRes['isWebmail'];
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar('Failed'),
          );
        isLoading(false);
      }
    } catch (e) {
      print(e);
    }
  }

  login(key, username, password) async {
    try {
      isLoading(true);
      var postData = {"username": username, "password": password};
      var response = await RemoteService().login(postData);
      print("login response data ------> $response");
      if (response != null) {
        var decodeRes = jsonDecode(response.body);
        print("=========> $decodeRes");
        if (decodeRes['status_code'] == 200) {
          isLoading(false);
          GetStorage().write("gs_login_username", username);
          GetStorage().write("gs_login_password", password);
          GetStorage().write("gs_login_data", decodeRes);
          if (key == 'login') {
            ScaffoldMessenger.of(Get.context!)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                Helper().snackBar("Login Success"),
              );
            Get.offAllNamed(Routes.home);
          } else {
            userInformation.update();
          }
        } else {
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              Helper().snackBar('Login Failed'),
            );
          isLoading(false);
        }
      } else {
        isLoading(false);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
    loginIdController.close();
  }
}
