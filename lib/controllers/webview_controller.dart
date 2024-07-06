import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class WebviewController extends GetxController {
  RxString url = 'https://hydrasave.com/account/login'.obs;
  RxDouble progress = 0.0.obs;
  InAppWebViewController? webViewController;

  void setUrl(value) {
    print("value ------------->>> $value");
    url.value = value;
    // webViewController!
    //     .loadUrl(urlRequest: URLRequest(url: Uri.parse(url.value)));
    update();
  }
}
