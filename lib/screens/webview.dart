import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:nitto_app/controllers/webview_controller.dart';

class WebView extends StatelessWidget {
  final controller = Get.put(WebviewController());

  @override
  Widget build(BuildContext context) {
    controller.setUrl(Get.arguments['value']);
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: controller,
          builder: (_) => Container(
            child: Column(children: <Widget>[
              // Container(
              //   padding: EdgeInsets.all(20.0),
              //   child: Text(
              //       "CURRENT URL\n${(controller.url.value.length > 50) ? controller.url.value.substring(0, 50) + "..." : controller.url.value}"),
              // ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: controller.progress.value < 1.0
                      ? LinearProgressIndicator(
                          value: controller.progress.value)
                      : Container()),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: InAppWebView(
                    initialUrlRequest:
                        URLRequest(url: Uri.parse(controller.url.value)),
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(),
                    ),
                    onWebViewCreated: (controllerr) {
                      controller.webViewController = controllerr;
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
