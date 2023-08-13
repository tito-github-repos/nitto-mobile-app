import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitto_app/controllers/login_controller.dart';
import 'package:nitto_app/utils/app_colors.dart';
import 'package:nitto_app/utils/utils.dart';

class Login extends StatelessWidget {
  final controller = Get.put(LoginController());
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    Utils().transparent();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nitto Hydranautics',
                style: TextStyle(fontSize: 24.0, color: AppColors.black),
              ),
              Icon(
                Icons.person,
                size: 100,
                color: AppColors.loginIconColor,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                  child: SizedBox(
                    width: MediaQuery.of(Get.context!).size.width * 0.80,
                    child: Form(
                      key: controller.loginFormKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller.loginIdController.value,
                            validator: (registerMobileController) {
                              if (registerMobileController!.isEmpty) {
                                return 'Emp ID required *';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Emp ID *",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    BorderSide(color: AppColors.primary),
                              ),
                              prefixIcon:
                                  Icon(Icons.person, color: AppColors.black),
                              labelStyle: TextStyle(color: AppColors.black),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: controller.loginPassController.value,
                            obscureText: controller.passObscure.value,
                            validator: (loginIdController) {
                              if (loginIdController!.isEmpty) {
                                return 'Password Required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: controller.passObscure.value == true
                                  ? IconButton(
                                      onPressed: () => {
                                        // controller.passObscure.value =
                                        //     !controller.passObscure.value
                                      },
                                      icon: Icon(
                                        Icons.visibility_off,
                                        color: AppColors.black,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () => {
                                        // controller.passObscure.value =
                                        //     !controller.passObscure.value
                                      },
                                      icon: Icon(
                                        Icons.visibility,
                                        color: AppColors.primary,
                                      ),
                                    ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    BorderSide(color: AppColors.primary),
                              ),
                              prefixIcon: Icon(
                                Icons.key,
                                color: AppColors.black,
                              ),
                              labelStyle: TextStyle(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          controller.isLoading.isFalse
                              ? Container(
                                  height: 40,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                      left: 60, right: 60),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      // if (controller
                                      //     .loginFormKey.currentState!
                                      //     .validate()) {
                                      //   controller.login();
                                      // } else {
                                      //   ScaffoldMessenger.of(context)
                                      //     ..hideCurrentSnackBar()
                                      //     ..showSnackBar(
                                      //       Helper().snackBar('On Snap!',
                                      //           'please fill all the fields'),
                                      //     );
                                      // }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                              : Utils().loadingProgressBar(),
                          const SizedBox(height: 24)
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       "copyrights @",
                          //       style: TextStyle(color: AppColors.black),
                          //     ),
                          //     TextButton(
                          //       onPressed: () {
                          //         //Get.offAllNamed(RouteHelper.auth);
                          //       },
                          //       child: Text(
                          //         "Real List",
                          //         style: TextStyle(
                          //           color: AppColors.primary,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
