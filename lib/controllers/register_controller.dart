import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitto_app/routes/routes.dart';

import '../services/remote_service.dart';
import '../utils/helper.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final regEmailController = TextEditingController().obs;
  final regPassController = TextEditingController().obs;
  final regConPassController = TextEditingController().obs;
  final regNameController = TextEditingController().obs;
  final regAddressController = TextEditingController().obs;
  final regCityController = TextEditingController().obs;
  final regRegionController = TextEditingController().obs;
  final regCountryController = TextEditingController().obs;
  final regZipController = TextEditingController().obs;
  final regMobileController = TextEditingController().obs;
  final regIndController = TextEditingController().obs;
  final regComController = TextEditingController().obs;
  final regDesController = TextEditingController().obs;

  var isLoading = false.obs;
  var passObscure = true.obs;

  register() async {
    try {
      if (regPassController.value.text != regConPassController.value.text) {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar('Password and confirm password should be same !'),
          );
        return;
      }

      isLoading(true);
      var payLoad = {
        "emailID": regEmailController.value.text.trim().toString(),
        "password": regPassController.value.text.toString(),
        "firstName": regNameController.value.text.toString(),
        "address": regAddressController.value.text.toString(),
        "city": regCityController.value.text.toString(),
        "country": regCountryController.value.text.toString(),
        "pincode": regZipController.value.text,
        "companyName": regComController.value.text.toString(),
        "designation": regDesController.value.text.toString(),
        "isActive": true.toString(),
        "remarks": "None",
        "mobileNo": regMobileController.value.text.toString(),
        "region": "Asia",
        "industry": "Oil and Gas"
      };
      var response = await RemoteService().register(jsonEncode(payLoad));
      print("service return response ---------> $response");
      if (response != null) {
        var result = jsonDecode(response.body);
        print(result);
        if (result["status_code"] == 200) {
          print(result);
          isLoading(false);
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(Helper().snackBar("Register Success"));
          Timer(new Duration(seconds: 2), () {
            Get.offAllNamed(Routes.login);
          });

          // showDialog<void>(
          //   context: Get.context!,
          //   builder: (BuildContext context) {
          //     return AlertDialog(
          //       backgroundColor: AppColors.white,
          //       title: Text('${result["status_message"]}'),
          //       content: Text(
          //           "Account for this ${regEmailController.value.text} successfully completed the Registration Your request has been sent to Sales team for approval"),
          //       actions: <Widget>[
          //         TextButton(
          //           child: const Text('Login'),
          //           onPressed: () {
          //             Get.offAll(Login());
          //           },
          //         ),
          //       ],
          //     );
          //   },
          // );
        } else {
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(Helper().snackBar(result["status_message"]));
          isLoading(false);
        }
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
              Helper().snackBar('something went to wrong while login'));
        isLoading(false);
      }
    } catch (e) {
      print("catch calling =====> $e");
      ScaffoldMessenger.of(Get.context!)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            Helper().snackBar('something went to wrong while login'));
      isLoading(false);
    }
  }
}
