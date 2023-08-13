import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final loginIdController = TextEditingController().obs;
  final loginPassController = TextEditingController().obs;

  var isLoading = false.obs;
  var passObscure = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
