import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Helper {
  authTransparent() {
    return SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff161d27),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  snackBar(content) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: Text(content),
    );
  }

  loadingProgressBar() {
    return SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        backgroundColor: Colors.blue[600],
        color: Colors.blue[900],
      ),
    );
  }
}
