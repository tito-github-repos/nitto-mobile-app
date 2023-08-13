import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitto_app/controllers/controller_binding.dart';
import 'package:nitto_app/controllers/general_controller.dart';
import 'package:nitto_app/routes/routes.dart';
import 'package:nitto_app/utils/app_strings.dart';

void main() {
  Get.put(GeneralController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      navigatorKey: Get.key,
      initialBinding: ControllerBinding(),
      getPages: Routes.routes,
      initialRoute: Routes.login,
    );
  }
}
