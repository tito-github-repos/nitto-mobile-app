import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nitto_app/controllers/login_controller.dart';
import 'package:nitto_app/utils/app_colors.dart';
import 'package:nitto_app/utils/utils.dart';

import '../utils/helper.dart';

class Login extends StatelessWidget {
  final controller = Get.put(LoginController());
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color.fromARGB(179, 255, 255, 255),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 10,
                color: const Color.fromARGB(231, 249, 252, 255),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HYDRA ',
                              style: TextStyle(
                                fontSize: 34.0,
                                color: Colors.blue[900],
                                fontFamily: 'poppins',
                              ),
                            ),
                            Text(
                              'SAVE',
                              style: TextStyle(
                                fontSize: 34.0,
                                color: Colors.blue[600],
                                fontFamily: 'poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                          child: SizedBox(
                            width:
                                MediaQuery.of(Get.context!).size.width * 0.80,
                            child: Form(
                              key: controller.loginFormKey,
                              autovalidateMode: AutovalidateMode.always,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 90,
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      onChanged: (s) =>
                                          controller.isEmailValid(s) == true
                                              ? controller.checkUser()
                                              : controller.loginIdErrMsg.value =
                                                  '',
                                      controller:
                                          controller.loginIdController.value,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return 'email required *';
                                        } else if (controller
                                                .loginIdErrMsg.value !=
                                            '') {
                                          return controller.loginIdErrMsg.value;
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        labelText: "USERNAME",
                                        filled: true,
                                        fillColor: AppColors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          borderSide: BorderSide(
                                              color: AppColors.offWhite),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          borderSide: BorderSide(
                                              color: AppColors.offWhite),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          borderSide: BorderSide(
                                              color: AppColors.offWhite),
                                        ),
                                        labelStyle: TextStyle(
                                            color: AppColors.offWhite),
                                        prefixIcon: Icon(Icons.person,
                                            color: AppColors.offWhite),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 90,
                                    child: Obx(
                                      () => TextFormField(
                                        enabled: controller.isExist.value,
                                        controller: controller
                                            .loginPassController.value,
                                        obscureText:
                                            controller.passObscure.value,
                                        validator: controller.isExist.isTrue
                                            ? (loginPassController) {
                                                if (loginPassController!
                                                    .isEmpty) {
                                                  return 'Password Required *';
                                                }
                                                return null;
                                              }
                                            : null,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          labelText: "PASSWORD",
                                          filled: true,
                                          fillColor:
                                              controller.isExist.value == true
                                                  ? AppColors.white
                                                  : const Color.fromARGB(
                                                      255, 244, 244, 244),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          prefixIcon: Icon(Icons.lock,
                                              color: AppColors.offWhite),
                                          labelStyle: TextStyle(
                                              color: AppColors.offWhite),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Obx(
                                        () => TextButton(
                                          onPressed:
                                              (controller.isExist.value == true)
                                                  ? (() => {})
                                                  : null,
                                          child: Text(
                                            'Reset Password',
                                            style: TextStyle(
                                                color:
                                                    (controller.isExist.value ==
                                                            true)
                                                        ? Colors.blue[600]
                                                        : Colors.grey,
                                                fontSize: 16,
                                                fontFamily: 'poppins'),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Obx(
                                    () => controller.isLoading.isFalse
                                        ? Container(
                                            height: 40,
                                            width: double.infinity,
                                            margin: const EdgeInsets.only(
                                                left: 80, right: 80),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(30),
                                              ),
                                              gradient: controller
                                                          .isExist.value ==
                                                      true
                                                  ? const LinearGradient(
                                                      colors: [
                                                        Color.fromARGB(
                                                            255, 18, 75, 154),
                                                        Color.fromARGB(
                                                            255, 84, 116, 161),
                                                      ],
                                                    )
                                                  : const LinearGradient(
                                                      colors: [
                                                        Colors.grey,
                                                        Colors.grey,
                                                      ],
                                                    ),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: controller
                                                          .isExist.value ==
                                                      true
                                                  ? () async {
                                                      if (controller
                                                          .loginFormKey
                                                          .currentState!
                                                          .validate()) {
                                                        controller.login();
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                            context)
                                                          ..hideCurrentSnackBar()
                                                          ..showSnackBar(
                                                            Helper().snackBar(
                                                                'please fill all the fields'),
                                                          );
                                                      }
                                                    }
                                                  : null,
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                              child: Text(
                                                "Login",
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Utils().loadingProgressBar(),
                                  ),
                                  const SizedBox(height: 10),
                                  // Obx(
                                  //   () => TextButton(
                                  //     onPressed: (controller.isExist.value ==
                                  //                 true &&
                                  //             controller.isValidMail.value ==
                                  //                 true)
                                  //         ? (() => {
                                  //               showDialog<void>(
                                  //                 context: Get.context!,
                                  //                 builder:
                                  //                     (BuildContext context) {
                                  //                   return AlertDialog(
                                  //                     backgroundColor:
                                  //                         AppColors.white,
                                  //                     title: Column(
                                  //                       children: [
                                  //                         Icon(
                                  //                           Icons.warning,
                                  //                           color: Colors
                                  //                               .blue[900],
                                  //                         ),
                                  //                         SizedBox(height: 10),
                                  //                         Text(
                                  //                           'Webmail warning',
                                  //                           style: TextStyle(
                                  //                               color: Colors
                                  //                                   .blue[900]),
                                  //                         ),
                                  //                       ],
                                  //                     ),
                                  //                     content: const Text(
                                  //                         "You have entered a Webmail, which will take further processing from the Sales side to gain access to the application. Do you want to continue"),
                                  //                     actions: <Widget>[
                                  //                       ElevatedButton(
                                  //                         style: ElevatedButton
                                  //                             .styleFrom(
                                  //                           backgroundColor:
                                  //                               Colors
                                  //                                   .blue[900],
                                  //                           shadowColor: Colors
                                  //                               .transparent,
                                  //                           shape:
                                  //                               RoundedRectangleBorder(
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         30),
                                  //                           ),
                                  //                         ),
                                  //                         onPressed: () => {
                                  //                           Get.toNamed(
                                  //                               Routes.register)
                                  //                         },
                                  //                         child: const Text(
                                  //                           'Yes, I wish to continue',
                                  //                           style: TextStyle(
                                  //                             color:
                                  //                                 Colors.white,
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       TextButton(
                                  //                         child: const Text(
                                  //                             'No Thanks'),
                                  //                         onPressed: () {
                                  //                           Get.back();
                                  //                         },
                                  //                       ),
                                  //                     ],
                                  //                   );
                                  //                 },
                                  //               ),
                                  //             })
                                  //         : null,
                                  //     child: Text(
                                  //       'Create Account',
                                  //       style: TextStyle(
                                  //         fontSize: 20,
                                  //         color: (controller.isExist.value ==
                                  //                     false &&
                                  //                 controller
                                  //                         .isValidMail.value ==
                                  //                     true)
                                  //             ? Colors.blue[900]
                                  //             : Color.fromARGB(
                                  //                 255, 146, 173, 213),
                                  //         fontFamily: 'poppins',
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // const SizedBox(height: 40),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 20,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 198, 48, 37),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0)),
                              ),
                              child: const RotatedBox(
                                quarterTurns: -1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 2),
                                  child: Text(
                                    "Support",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: 80,
                            child: Image.asset(
                              'assets/images/nitto_hyd.png',
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "support@hydrasave.com",
                        style: TextStyle(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
