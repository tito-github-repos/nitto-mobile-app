import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class GeneralController extends GetxController {
  //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  var connectionType = 0.obs;

  final Connectivity connectivity = Connectivity();

  late StreamSubscription streamSubscription;

  @override
  void onInit() {
    super.onInit();
    configurations();
    portrait();
    getConnectivityType();
    streamSubscription = connectivity.onConnectivityChanged.listen(updateState);
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onClose() {
    super.onClose();
    streamSubscription.cancel();
  }

  /* concrete binding for applications based on the Widgets framework */
  void configurations() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  /* app portrait lock method */
  void portrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /* internet connection check method */
  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return updateState(connectivityResult);
  }

  updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        //Utils().showSnackBar('internet connected');
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        //Utils().showSnackBar('internet connected');
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        Utils().showSnackBar('please connect to internet');
        break;
      default:
        Utils().showSnackBar('Failed to get connection type');
        break;
    }
  }
}
