import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class Utils {
  showSnackBar(content) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text('$content'),
      ),
    );
  }

  loadingProgressBar() {
    return SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey,
        color: AppColors.primary,
      ),
    );
  }

  transparent() {
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: AppColors.primary,
        systemNavigationBarColor: AppColors.primary,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
