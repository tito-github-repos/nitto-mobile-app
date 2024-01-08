import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nitto_app/controllers/register_controller.dart';
import 'package:nitto_app/routes/routes.dart';

import '../utils/app_colors.dart';
import '../utils/helper.dart';
import '../utils/utils.dart';

class Register extends StatelessWidget {
  final controller = Get.put(RegisterController());
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(179, 255, 255, 255),
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container()),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                          height: 40,
                          child: Image.asset(
                            'assets/images/nitto_hyd.png',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HYDRA ',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.blue[900],
                                fontFamily: 'poppins',
                              ),
                            ),
                            Text(
                              'SAVE',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.blue[600],
                                fontFamily: 'poppins',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 10,
                        color: Color.fromARGB(231, 245, 249, 255),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.blue[900],
                                      fontFamily: 'poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    top: 16.0,
                                    bottom: 16.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(Get.context!).size.width *
                                          0.80,
                                  child: Form(
                                    key: controller.registerFormKey,
                                    autovalidateMode: AutovalidateMode.always,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: controller
                                              .regEmailController.value,
                                          validator: (regEmailController) {
                                            if (regEmailController!.isEmpty) {
                                              return 'Email address or username required *';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: "Email *",
                                            filled: true,
                                            fillColor: AppColors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.offWhite),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: controller
                                                    .regPassController.value,
                                                obscureText: controller
                                                    .passObscure.value,
                                                validator: (regPassController) {
                                                  if (regPassController!
                                                      .isEmpty) {
                                                    return 'Password Required';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never,
                                                  labelText: "Password",
                                                  filled: true,
                                                  fillColor: AppColors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color:
                                                          AppColors.offWhite),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: TextFormField(
                                                controller: controller
                                                    .regConPassController.value,
                                                obscureText: controller
                                                    .passObscure.value,
                                                validator:
                                                    (regConPassController) {
                                                  if (regConPassController!
                                                      .isEmpty) {
                                                    return 'Confirm Password Required';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never,
                                                  labelText:
                                                      "Confirm Password *",
                                                  filled: true,
                                                  fillColor: AppColors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color:
                                                          AppColors.offWhite),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          keyboardType: TextInputType.text,
                                          controller: controller
                                              .regNameController.value,
                                          validator: (regNameController) {
                                            if (regNameController!.isEmpty) {
                                              return 'name required *';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: "Name *",
                                            filled: true,
                                            fillColor: AppColors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.offWhite),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: controller
                                              .regMobileController.value,
                                          validator: (regMobileController) {
                                            if (regMobileController!.isEmpty) {
                                              return 'mobile no required *';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: "Mobile No *",
                                            filled: true,
                                            fillColor: AppColors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.offWhite),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          keyboardType: TextInputType.text,
                                          controller: controller
                                              .regAddressController.value,
                                          validator: (regAddressController) {
                                            if (regAddressController!.isEmpty) {
                                              return 'address required *';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: "Address *",
                                            filled: true,
                                            fillColor: AppColors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.offWhite),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: controller
                                                    .regCityController.value,
                                                validator: (regCityController) {
                                                  if (regCityController!
                                                      .isEmpty) {
                                                    return 'city required *';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never,
                                                  labelText: "City *",
                                                  filled: true,
                                                  fillColor: AppColors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color:
                                                          AppColors.offWhite),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: DropdownButtonFormField(
                                                validator:
                                                    (registerRegionController) {
                                                  if (registerRegionController!
                                                      .isEmpty) {
                                                    return 'region required *';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: AppColors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color:
                                                          AppColors.offWhite),
                                                ),
                                                dropdownColor:
                                                    AppColors.offWhite,
                                                value: 'Asia',
                                                onChanged:
                                                    (String? newValue) {},
                                                items: <String>[
                                                  'Asia'
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: const TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                              // child: TextFormField(
                                              //   keyboardType:
                                              //       TextInputType.text,
                                              //   controller: controller
                                              //       .regRegionController.value,
                                              //   validator:
                                              //       (registerMobileController) {
                                              //     if (registerMobileController!
                                              //         .isEmpty) {
                                              //       return 'region required *';
                                              //     }
                                              //     return null;
                                              //   },
                                              //   decoration: InputDecoration(
                                              //     floatingLabelBehavior:
                                              //         FloatingLabelBehavior
                                              //             .never,
                                              //     labelText: "Region *",
                                              //     filled: true,
                                              //     fillColor: AppColors.white,
                                              //     border: OutlineInputBorder(
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               10.0),
                                              //       borderSide: BorderSide(
                                              //           color:
                                              //               AppColors.offWhite),
                                              //     ),
                                              //     enabledBorder:
                                              //         OutlineInputBorder(
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               10.0),
                                              //       borderSide: BorderSide(
                                              //           color:
                                              //               AppColors.offWhite),
                                              //     ),
                                              //     focusedBorder:
                                              //         OutlineInputBorder(
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               10.0),
                                              //       borderSide: BorderSide(
                                              //           color:
                                              //               AppColors.offWhite),
                                              //     ),
                                              //     labelStyle: TextStyle(
                                              //         color:
                                              //             AppColors.offWhite),
                                              //   ),
                                              // ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: controller
                                                    .regCountryController.value,
                                                validator:
                                                    (regCountryController) {
                                                  if (regCountryController!
                                                      .isEmpty) {
                                                    return 'country required *';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never,
                                                  labelText: "Country *",
                                                  filled: true,
                                                  fillColor: AppColors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color:
                                                          AppColors.offWhite),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: controller
                                                    .regZipController.value,
                                                validator: (regZipController) {
                                                  if (regZipController!
                                                      .isEmpty) {
                                                    return 'zipcode required *';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never,
                                                  labelText: "zipcode *",
                                                  filled: true,
                                                  fillColor: AppColors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color:
                                                          AppColors.offWhite),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: DropdownButtonFormField(
                                                validator: (regIndController) {
                                                  if (regIndController!
                                                      .isEmpty) {
                                                    return 'region required *';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: AppColors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color:
                                                          AppColors.offWhite),
                                                ),
                                                dropdownColor:
                                                    AppColors.offWhite,
                                                value: 'Oil and Gas',
                                                onChanged:
                                                    (String? newValue) {},
                                                items: <String>[
                                                  'Oil and Gas'
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: const TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                              // child: TextFormField(
                                              //   keyboardType:
                                              //       TextInputType.text,
                                              //   controller: controller
                                              //       .regIndController.value,
                                              //   validator:
                                              //       (registerMobileController) {
                                              //     if (registerMobileController!
                                              //         .isEmpty) {
                                              //       return 'Industry type required *';
                                              //     }
                                              //     return null;
                                              //   },
                                              //   decoration: InputDecoration(
                                              //     floatingLabelBehavior:
                                              //         FloatingLabelBehavior
                                              //             .never,
                                              //     labelText: "Industry Type *",
                                              //     filled: true,
                                              //     fillColor: AppColors.white,
                                              //     border: OutlineInputBorder(
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               10.0),
                                              //       borderSide: BorderSide(
                                              //           color:
                                              //               AppColors.offWhite),
                                              //     ),
                                              //     enabledBorder:
                                              //         OutlineInputBorder(
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               10.0),
                                              //       borderSide: BorderSide(
                                              //           color:
                                              //               AppColors.offWhite),
                                              //     ),
                                              //     focusedBorder:
                                              //         OutlineInputBorder(
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               10.0),
                                              //       borderSide: BorderSide(
                                              //           color:
                                              //               AppColors.offWhite),
                                              //     ),
                                              //     labelStyle: TextStyle(
                                              //         color:
                                              //             AppColors.offWhite),
                                              //   ),
                                              // ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: controller
                                                    .regComController.value,
                                                validator: (regComController) {
                                                  if (regComController!
                                                      .isEmpty) {
                                                    return 'company required *';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never,
                                                  labelText: "Company Name *",
                                                  filled: true,
                                                  fillColor: AppColors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color:
                                                          AppColors.offWhite),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          keyboardType: TextInputType.text,
                                          controller:
                                              controller.regDesController.value,
                                          validator: (regDesController) {
                                            if (regDesController!.isEmpty) {
                                              return 'designation required *';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: "Designation *",
                                            filled: true,
                                            fillColor: AppColors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.offWhite),
                                          ),
                                        ),
                                        const SizedBox(height: 30),
                                        Obx(
                                          () => controller.isLoading.isFalse
                                              ? Container(
                                                  height: 40,
                                                  width: double.infinity,
                                                  margin: const EdgeInsets.only(
                                                      left: 80, right: 80),
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(30),
                                                    ),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color.fromARGB(
                                                            255, 18, 75, 154),
                                                        Color.fromARGB(
                                                            255, 84, 116, 161),
                                                      ],
                                                    ),
                                                  ),
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      if (controller
                                                          .registerFormKey
                                                          .currentState!
                                                          .validate()) {
                                                        controller.register();
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                            context)
                                                          ..hideCurrentSnackBar()
                                                          ..showSnackBar(
                                                            Helper().snackBar(
                                                                'please fill all the fields'),
                                                          );
                                                      }
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      shadowColor:
                                                          Colors.transparent,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Submit",
                                                      style: TextStyle(
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Utils().loadingProgressBar(),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Already have an account ?",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: (() => {
                                                    Get.offAllNamed(
                                                        Routes.login)
                                                  }),
                                              child: Text(
                                                'Login Now',
                                                style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
