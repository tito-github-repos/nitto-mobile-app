import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nitto_app/controllers/set_points_controller.dart';

import '../utils/app_colors.dart';
import '../utils/helper.dart';
import 'include/app_bar.dart';
import 'include/drawer_menu.dart';

class SetPoints extends StatelessWidget {
  final controller = Get.put(SetPointsController());
  SetPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: const DynamicAppBar(),
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
          SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        color: Colors.blue[50],
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "    ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.indigo[900],
                                ),
                              ),
                              Text(
                                "Set Points",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.indigo[900],
                                ),
                              ),
                              Text(
                                GetStorage()
                                    .read('gs_login_data')['companyName'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.indigo[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "Plant",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 10),
                                  Card(
                                    elevation: 3, // Set the elevation as needed
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      height: 30,
                                      child: GetBuilder(
                                        init: controller,
                                        builder: (_) => DropdownButtonFormField(
                                          isDense: true,
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 232, 232, 232),
                                                  width: 1.5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 1.5),
                                            ),
                                          ),
                                          value: controller.plantValue,
                                          onChanged: (value) {
                                            print("-----------> $value");
                                            controller.plantValue =
                                                value.toString();
                                            controller.getTrain('manual');
                                          },
                                          items: controller.plantModel?.data!
                                              .map((plant) => DropdownMenuItem(
                                                    value: plant.plantId,
                                                    child: Tooltip(
                                                      message: plant.plantName,
                                                      child: Text(
                                                        "${plant.plantName}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "Train",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 10),
                                  Card(
                                    elevation: 3, // Set the elevation as needed
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width:
                                          120, // Increase the width as needed
                                      height: 30,
                                      child: GetBuilder(
                                        init: controller,
                                        builder: (_) => DropdownButtonFormField(
                                          isDense: true,
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 232, 232, 232),
                                                  width: 1.5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 1.5),
                                            ),
                                          ),
                                          value: controller.trainValue,
                                          onChanged: (value) {
                                            controller.trainValue =
                                                value.toString();
                                            controller.getPass('manual');
                                          },
                                          items: controller.trainModel?.data!
                                              .map(
                                                (train) => DropdownMenuItem(
                                                  value: train.trainId,
                                                  child: Tooltip(
                                                    message: train.trainName,
                                                    child: Text(
                                                      "${train.trainName}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "Pass",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 10),
                                  Card(
                                    elevation: 3, // Set the elevation as needed
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width:
                                          120, // Increase the width as needed
                                      height: 30,
                                      child: GetBuilder(
                                        init: controller,
                                        builder: (_) => DropdownButtonFormField(
                                          isDense: true,
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 232, 232, 232),
                                                  width: 1.5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 1.5),
                                            ),
                                          ),
                                          value: controller.passValue,
                                          onChanged: (value) {
                                            controller.passValue =
                                                value.toString();
                                            controller.getStage('manual');
                                          },
                                          items: controller.passModel?.data!
                                              .map(
                                                (pass) => DropdownMenuItem(
                                                  value: pass.passId,
                                                  child: Tooltip(
                                                    message: pass.passName,
                                                    child: Text(
                                                      "${pass.passName}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "Stage",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 10),
                                  Card(
                                    elevation: 3, // Set the elevation as needed
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width:
                                          120, // Increase the width as needed
                                      height: 30,
                                      child: GetBuilder(
                                        init: controller,
                                        builder: (_) => DropdownButtonFormField(
                                          isDense: true,
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 232, 232, 232),
                                                  width: 1.5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 1.5),
                                            ),
                                          ),
                                          value: controller.stageValue,
                                          onChanged: (value) {
                                            controller.stageValue =
                                                value.toString();
                                            controller.getStage('manual');
                                          },
                                          items: controller.stageModel?.data!
                                              .map(
                                                (stage) => DropdownMenuItem(
                                                  value: stage.stageId,
                                                  child: Tooltip(
                                                    message: stage.stageName,
                                                    child: Text(
                                                      "${stage.stageName}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                margin: const EdgeInsets.all(8.0),
                                color: const Color.fromARGB(246, 255, 255, 255),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 137, 226, 253)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 14, right: 14, bottom: 60),
                                  child: Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Obx(
                                          () => Form(
                                            key: controller.setFormkey,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 180),
                                                    Container(
                                                      height: 30,
                                                      width: 150,
                                                      color: Colors.blue[900],
                                                      child: const Align(
                                                        child: Text(
                                                          'High High',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Container(
                                                      height: 30,
                                                      width: 150,
                                                      color: Colors.blue[900],
                                                      child: const Align(
                                                        child: Text(
                                                          'High',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    // const SizedBox(width: 20),
                                                    // Container(
                                                    //   height: 30,
                                                    //   width: 150,
                                                    //   color: Colors.blue[900],
                                                    //   child: const Align(
                                                    //     child: Text(
                                                    //       'Reference',
                                                    //       style: TextStyle(
                                                    //           color:
                                                    //               Colors.white),
                                                    //       textAlign:
                                                    //           TextAlign.center,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    const SizedBox(width: 20),
                                                    Container(
                                                      height: 30,
                                                      width: 150,
                                                      color: Colors.blue[900],
                                                      child: const Align(
                                                        child: Text(
                                                          'Low',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Container(
                                                      height: 30,
                                                      width: 150,
                                                      color: Colors.blue[900],
                                                      child: const Align(
                                                        child: Text(
                                                          'Low Low',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Container(
                                                      height: 30,
                                                      width: 90,
                                                      color: Colors.orange[900],
                                                      child: const Align(
                                                        child: Text(
                                                          'Alarms',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 30),
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                      height: 50,
                                                      width: 120,
                                                      child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            'Normalised Permeate Flow',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                        height: 40,
                                                        width: 150,
                                                        child: TextFormField(
                                                            inputFormatters: <TextInputFormatter>[
                                                              LengthLimitingTextInputFormatter(
                                                                  10),
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      "[0-9,.]")),
                                                            ],
                                                            controller:
                                                                controller
                                                                    .npf_highhigh
                                                                    .value,
                                                            validator: (text) {
                                                              if (double.parse(
                                                                      text!) >=
                                                                  100) {
                                                                controller
                                                                        .errorMessage =
                                                                    'High High cannot exceed 100';
                                                                return '';
                                                              }
                                                              return null;
                                                            },
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            onChanged:
                                                                (value) => {},
                                                            decoration:
                                                                InputDecoration(
                                                              errorStyle:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          1,
                                                                      height:
                                                                          0),
                                                              isDense: true,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          20,
                                                                          10,
                                                                          0),
                                                              floatingLabelBehavior:
                                                                  FloatingLabelBehavior
                                                                      .never,
                                                              filled: true,
                                                              fillColor:
                                                                  AppColors
                                                                      .white,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .offWhite),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .offWhite),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .offWhite),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                borderSide:
                                                                    BorderSide(
                                                                        color: Colors
                                                                            .red),
                                                              ),
                                                              labelStyle: TextStyle(
                                                                  color: AppColors
                                                                      .offWhite),
                                                              suffixIcon: Icon(
                                                                  Icons.percent,
                                                                  color: AppColors
                                                                      .offWhite),
                                                            ))),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: TextFormField(
                                                        inputFormatters: <TextInputFormatter>[
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  "[0-9,.]")),
                                                        ],
                                                        controller: controller
                                                            .npf_high.value,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: (value) =>
                                                            {},
                                                        validator: (text) {
                                                          if (double.parse(
                                                                  text!) >=
                                                              100) {
                                                            controller
                                                                    .errorMessage =
                                                                'High cannot exceed 100';
                                                            return '';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          errorStyle:
                                                              const TextStyle(
                                                                  height: 0),
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      10,
                                                                      20,
                                                                      10,
                                                                      0),
                                                          floatingLabelBehavior:
                                                              FloatingLabelBehavior
                                                                  .never,
                                                          filled: true,
                                                          fillColor:
                                                              AppColors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          labelStyle: TextStyle(
                                                              color: AppColors
                                                                  .offWhite),
                                                          suffixIcon: Icon(
                                                              Icons.percent,
                                                              color: AppColors
                                                                  .offWhite),
                                                        ),
                                                      ),
                                                    ),
                                                    // const SizedBox(width: 20),
                                                    // SizedBox(
                                                    //   height: 40,
                                                    //   width: 150,
                                                    //   child: TextFormField(
                                                    //     inputFormatters: <TextInputFormatter>[
                                                    //       LengthLimitingTextInputFormatter(
                                                    //           10),
                                                    //       FilteringTextInputFormatter
                                                    //           .allow(RegExp(
                                                    //               "[0-9,.]")),
                                                    //     ],
                                                    //     controller: controller
                                                    //         .npf_reference
                                                    //         .value,
                                                    //     keyboardType:
                                                    //         TextInputType
                                                    //             .number,
                                                    //     onChanged: (value) =>
                                                    //         {},
                                                    //     validator: (text) {
                                                    //       if (text!.isEmpty) {
                                                    //         return '';
                                                    //       }
                                                    //       return null;
                                                    //     },
                                                    //     decoration:
                                                    //         InputDecoration(
                                                    //       errorStyle:
                                                    //           const TextStyle(
                                                    //               height: 0),
                                                    //       isDense: true,
                                                    //       contentPadding:
                                                    //           EdgeInsets
                                                    //               .fromLTRB(
                                                    //                   10,
                                                    //                   20,
                                                    //                   10,
                                                    //                   0),
                                                    //       floatingLabelBehavior:
                                                    //           FloatingLabelBehavior
                                                    //               .never,
                                                    //       filled: true,
                                                    //       fillColor:
                                                    //           AppColors.white,
                                                    //       border:
                                                    //           OutlineInputBorder(
                                                    //         borderRadius:
                                                    //             BorderRadius
                                                    //                 .circular(
                                                    //                     10.0),
                                                    //         borderSide: BorderSide(
                                                    //             color: AppColors
                                                    //                 .offWhite),
                                                    //       ),
                                                    //       enabledBorder:
                                                    //           OutlineInputBorder(
                                                    //         borderRadius:
                                                    //             BorderRadius
                                                    //                 .circular(
                                                    //                     10.0),
                                                    //         borderSide: BorderSide(
                                                    //             color: AppColors
                                                    //                 .offWhite),
                                                    //       ),
                                                    //       focusedBorder:
                                                    //           OutlineInputBorder(
                                                    //         borderRadius:
                                                    //             BorderRadius
                                                    //                 .circular(
                                                    //                     10.0),
                                                    //         borderSide: BorderSide(
                                                    //             color: AppColors
                                                    //                 .offWhite),
                                                    //       ),
                                                    //       labelStyle: TextStyle(
                                                    //           color: AppColors
                                                    //               .offWhite),
                                                    //       suffixIcon: Icon(
                                                    //           Icons.percent,
                                                    //           color: AppColors
                                                    //               .offWhite),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: TextFormField(
                                                        inputFormatters: <TextInputFormatter>[
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  "[0-9,.]")),
                                                        ],
                                                        controller: controller
                                                            .npf_low.value,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: (value) =>
                                                            {},
                                                        validator: (text) {
                                                          if (double.parse(
                                                                  text!) >=
                                                              100) {
                                                            controller
                                                                    .errorMessage =
                                                                'Low cannot exceed 100';
                                                            return '';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          errorStyle:
                                                              const TextStyle(
                                                                  height: 0),
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      10,
                                                                      20,
                                                                      10,
                                                                      0),
                                                          floatingLabelBehavior:
                                                              FloatingLabelBehavior
                                                                  .never,
                                                          filled: true,
                                                          fillColor:
                                                              AppColors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          labelStyle: TextStyle(
                                                              color: AppColors
                                                                  .offWhite),
                                                          suffixIcon: Icon(
                                                              Icons.percent,
                                                              color: AppColors
                                                                  .offWhite),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: TextFormField(
                                                        inputFormatters: <TextInputFormatter>[
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  "[0-9,.]")),
                                                        ],
                                                        controller: controller
                                                            .npf_lowlow.value,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: (value) =>
                                                            {},
                                                        validator: (text) {
                                                          if (double.parse(
                                                                  text!) >=
                                                              100) {
                                                            controller
                                                                    .errorMessage =
                                                                'Low Low cannot exceed 100';
                                                            return '';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          errorStyle:
                                                              const TextStyle(
                                                                  height: 0),
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      10,
                                                                      20,
                                                                      10,
                                                                      0),
                                                          floatingLabelBehavior:
                                                              FloatingLabelBehavior
                                                                  .never,
                                                          filled: true,
                                                          fillColor:
                                                              AppColors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          labelStyle: TextStyle(
                                                              color: AppColors
                                                                  .offWhite),
                                                          suffixIcon: Icon(
                                                              Icons.percent,
                                                              color: AppColors
                                                                  .offWhite),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Checkbox(
                                                      value: true,
                                                      onChanged: (bool? value) {
                                                        // controller.userAccess(
                                                        //     controller
                                                        //         .userManagementListModel!
                                                        //         .data![index]
                                                        //         .emailID
                                                        //         .toString(),
                                                        //     controller
                                                        //         .userManagementListModel!
                                                        //         .data![index]
                                                        //         .plant
                                                        //         .toString(),
                                                        //     value);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 30),
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                      height: 50,
                                                      width: 120,
                                                      child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            'Normalised Salt Passage',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: TextFormField(
                                                        inputFormatters: <TextInputFormatter>[
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  "[0-9,.]")),
                                                        ],
                                                        controller: controller
                                                            .nsp_highhigh.value,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: (value) =>
                                                            {},
                                                        validator: (text) {
                                                          if (double.parse(
                                                                  text!) >=
                                                              100) {
                                                            controller
                                                                    .errorMessage =
                                                                'High High cannot exceed 100';
                                                            return '';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          errorStyle:
                                                              const TextStyle(
                                                                  height: 0),
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      10,
                                                                      20,
                                                                      10,
                                                                      0),
                                                          floatingLabelBehavior:
                                                              FloatingLabelBehavior
                                                                  .never,
                                                          filled: true,
                                                          fillColor:
                                                              AppColors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          labelStyle: TextStyle(
                                                              color: AppColors
                                                                  .offWhite),
                                                          suffixIcon: Icon(
                                                              Icons.percent,
                                                              color: AppColors
                                                                  .offWhite),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: TextFormField(
                                                        inputFormatters: <TextInputFormatter>[
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  "[0-9,.]")),
                                                        ],
                                                        controller: controller
                                                            .nsp_high.value,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: (value) =>
                                                            {},
                                                        validator: (text) {
                                                          if (double.parse(
                                                                  text!) >=
                                                              100) {
                                                            controller
                                                                    .errorMessage =
                                                                'High cannot exceed 100';
                                                            return '';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          errorStyle:
                                                              const TextStyle(
                                                                  height: 0),
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      10,
                                                                      20,
                                                                      10,
                                                                      0),
                                                          floatingLabelBehavior:
                                                              FloatingLabelBehavior
                                                                  .never,
                                                          filled: true,
                                                          fillColor:
                                                              AppColors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          labelStyle: TextStyle(
                                                              color: AppColors
                                                                  .offWhite),
                                                          suffixIcon: Icon(
                                                              Icons.percent,
                                                              color: AppColors
                                                                  .offWhite),
                                                        ),
                                                      ),
                                                    ),
                                                    // const SizedBox(width: 20),
                                                    // SizedBox(
                                                    //     height: 40,
                                                    //     width: 150,
                                                    //     child:
                                                    //     TextFormField(
                                                    //       inputFormatters: <TextInputFormatter>[
                                                    //         LengthLimitingTextInputFormatter(
                                                    //             10),
                                                    //         FilteringTextInputFormatter
                                                    //             .allow(RegExp(
                                                    //                 "[0-9,.]")),
                                                    //       ],
                                                    //       controller: controller
                                                    //           .nsp_reference
                                                    //           .value,
                                                    //       keyboardType:
                                                    //           TextInputType
                                                    //               .number,
                                                    //       onChanged: (value) =>
                                                    //           {},
                                                    //       validator: (text) {
                                                    //         if (text!.isEmpty) {
                                                    //           return '';
                                                    //         }
                                                    //         return null;
                                                    //       },
                                                    //       decoration:
                                                    //           InputDecoration(
                                                    //         errorStyle:
                                                    //             const TextStyle(
                                                    //                 height: 0),
                                                    //         isDense: true,
                                                    //         contentPadding:
                                                    //             EdgeInsets
                                                    //                 .fromLTRB(
                                                    //                     10,
                                                    //                     20,
                                                    //                     10,
                                                    //                     0),
                                                    //         floatingLabelBehavior:
                                                    //             FloatingLabelBehavior
                                                    //                 .never,
                                                    //         filled: true,
                                                    //         fillColor:
                                                    //             AppColors.white,
                                                    //         border:
                                                    //             OutlineInputBorder(
                                                    //           borderRadius:
                                                    //               BorderRadius
                                                    //                   .circular(
                                                    //                       10.0),
                                                    //           borderSide: BorderSide(
                                                    //               color: AppColors
                                                    //                   .offWhite),
                                                    //         ),
                                                    //         enabledBorder:
                                                    //             OutlineInputBorder(
                                                    //           borderRadius:
                                                    //               BorderRadius
                                                    //                   .circular(
                                                    //                       10.0),
                                                    //           borderSide: BorderSide(
                                                    //               color: AppColors
                                                    //                   .offWhite),
                                                    //         ),
                                                    //         focusedBorder:
                                                    //             OutlineInputBorder(
                                                    //           borderRadius:
                                                    //               BorderRadius
                                                    //                   .circular(
                                                    //                       10.0),
                                                    //           borderSide: BorderSide(
                                                    //               color: AppColors
                                                    //                   .offWhite),
                                                    //         ),
                                                    //         labelStyle: TextStyle(
                                                    //             color: AppColors
                                                    //                 .offWhite),
                                                    //         suffixIcon: Icon(
                                                    //             Icons.percent,
                                                    //             color: AppColors
                                                    //                 .offWhite),
                                                    //       ),
                                                    //     ),
                                                    //     ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: Container(),
                                                      // TextFormField(
                                                      //   inputFormatters: <TextInputFormatter>[
                                                      //     LengthLimitingTextInputFormatter(
                                                      //         10),
                                                      //     FilteringTextInputFormatter
                                                      //         .allow(RegExp(
                                                      //             "[0-9,.]")),
                                                      //   ],
                                                      //   controller: controller
                                                      //       .nsp_low.value,
                                                      //   keyboardType:
                                                      //       TextInputType
                                                      //           .number,
                                                      //   onChanged: (value) =>
                                                      //       {},
                                                      //   validator: (text) {
                                                      //     if (text!.isEmpty) {
                                                      //       return '';
                                                      //     }
                                                      //     return null;
                                                      //   },
                                                      //   decoration:
                                                      //       InputDecoration(
                                                      //     errorStyle:
                                                      //         const TextStyle(
                                                      //             height: 0),
                                                      //     isDense: true,
                                                      //     contentPadding:
                                                      //         EdgeInsets
                                                      //             .fromLTRB(
                                                      //                 10,
                                                      //                 20,
                                                      //                 10,
                                                      //                 0),
                                                      //     floatingLabelBehavior:
                                                      //         FloatingLabelBehavior
                                                      //             .never,
                                                      //     filled: true,
                                                      //     fillColor:
                                                      //         AppColors.white,
                                                      //     border:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     enabledBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     focusedBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     labelStyle: TextStyle(
                                                      //         color: AppColors
                                                      //             .offWhite),
                                                      //     suffixIcon: Icon(
                                                      //         Icons.percent,
                                                      //         color: AppColors
                                                      //             .offWhite),
                                                      //   ),
                                                      // ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: Container(),
                                                      // TextFormField(
                                                      //   inputFormatters: <TextInputFormatter>[
                                                      //     LengthLimitingTextInputFormatter(
                                                      //         10),
                                                      //     FilteringTextInputFormatter
                                                      //         .allow(RegExp(
                                                      //             "[0-9,.]")),
                                                      //   ],
                                                      //   controller: controller
                                                      //       .nsp_lowlow.value,
                                                      //   keyboardType:
                                                      //       TextInputType
                                                      //           .number,
                                                      //   onChanged: (value) =>
                                                      //       {},
                                                      //   validator: (text) {
                                                      //     if (text!.isEmpty) {
                                                      //       return '';
                                                      //     }
                                                      //     return null;
                                                      //   },
                                                      //   decoration:
                                                      //       InputDecoration(
                                                      //     errorStyle:
                                                      //         const TextStyle(
                                                      //             height: 0),
                                                      //     isDense: true,
                                                      //     contentPadding:
                                                      //         EdgeInsets
                                                      //             .fromLTRB(
                                                      //                 10,
                                                      //                 20,
                                                      //                 10,
                                                      //                 0),
                                                      //     floatingLabelBehavior:
                                                      //         FloatingLabelBehavior
                                                      //             .never,
                                                      //     filled: true,
                                                      //     fillColor:
                                                      //         AppColors.white,
                                                      //     border:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     enabledBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     focusedBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     labelStyle: TextStyle(
                                                      //         color: AppColors
                                                      //             .offWhite),
                                                      //     suffixIcon: Icon(
                                                      //         Icons.percent,
                                                      //         color: AppColors
                                                      //             .offWhite),
                                                      //   ),
                                                      // ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Checkbox(
                                                      value: true,
                                                      onChanged: (bool? value) {
                                                        // controller.userAccess(
                                                        //     controller
                                                        //         .userManagementListModel!
                                                        //         .data![index]
                                                        //         .emailID
                                                        //         .toString(),
                                                        //     controller
                                                        //         .userManagementListModel!
                                                        //         .data![index]
                                                        //         .plant
                                                        //         .toString(),
                                                        //     value);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 30),
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                      height: 50,
                                                      width: 120,
                                                      child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            'Normalised DP',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: TextFormField(
                                                        inputFormatters: <TextInputFormatter>[
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  "[0-9,.]")),
                                                        ],
                                                        controller: controller
                                                            .ndp_highhigh.value,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: (value) =>
                                                            {},
                                                        validator: (text) {
                                                          if (double.parse(
                                                                  text!) >=
                                                              100) {
                                                            controller
                                                                    .errorMessage =
                                                                'High High cannot exceed 100';
                                                            return '';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          errorStyle:
                                                              const TextStyle(
                                                                  height: 0),
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      10,
                                                                      20,
                                                                      10,
                                                                      0),
                                                          floatingLabelBehavior:
                                                              FloatingLabelBehavior
                                                                  .never,
                                                          filled: true,
                                                          fillColor:
                                                              AppColors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          labelStyle: TextStyle(
                                                              color: AppColors
                                                                  .offWhite),
                                                          suffixIcon: Icon(
                                                              Icons.percent,
                                                              color: AppColors
                                                                  .offWhite),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: TextFormField(
                                                        inputFormatters: <TextInputFormatter>[
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  "[0-9,.]")),
                                                        ],
                                                        controller: controller
                                                            .ndp_high.value,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: (value) =>
                                                            {},
                                                        validator: (text) {
                                                          if (double.parse(
                                                                  text!) >=
                                                              100) {
                                                            controller
                                                                    .errorMessage =
                                                                'High cannot exceed 100';
                                                            return '';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          errorStyle:
                                                              const TextStyle(
                                                                  height: 0),
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      10,
                                                                      20,
                                                                      10,
                                                                      0),
                                                          floatingLabelBehavior:
                                                              FloatingLabelBehavior
                                                                  .never,
                                                          filled: true,
                                                          fillColor:
                                                              AppColors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide: BorderSide(
                                                                color: AppColors
                                                                    .offWhite),
                                                          ),
                                                          labelStyle: TextStyle(
                                                              color: AppColors
                                                                  .offWhite),
                                                          suffixIcon: Icon(
                                                              Icons.percent,
                                                              color: AppColors
                                                                  .offWhite),
                                                        ),
                                                      ),
                                                    ),
                                                    // const SizedBox(width: 20),
                                                    // SizedBox(
                                                    //   height: 40,
                                                    //   width: 150,
                                                    //   child: TextFormField(
                                                    //     inputFormatters: <TextInputFormatter>[
                                                    //       LengthLimitingTextInputFormatter(
                                                    //           10),
                                                    //       FilteringTextInputFormatter
                                                    //           .allow(RegExp(
                                                    //               "[0-9,.]")),
                                                    //     ],
                                                    //     controller: controller
                                                    //         .ndp_reference
                                                    //         .value,
                                                    //     keyboardType:
                                                    //         TextInputType
                                                    //             .number,
                                                    //     onChanged: (value) =>
                                                    //         {},
                                                    //     validator: (text) {
                                                    //       if (text!.isEmpty) {
                                                    //         return '';
                                                    //       }
                                                    //       return null;
                                                    //     },
                                                    //     decoration:
                                                    //         InputDecoration(
                                                    //       errorStyle:
                                                    //           const TextStyle(
                                                    //               height: 0),
                                                    //       isDense: true,
                                                    //       contentPadding:
                                                    //           EdgeInsets
                                                    //               .fromLTRB(
                                                    //                   10,
                                                    //                   20,
                                                    //                   10,
                                                    //                   0),
                                                    //       floatingLabelBehavior:
                                                    //           FloatingLabelBehavior
                                                    //               .never,
                                                    //       filled: true,
                                                    //       fillColor:
                                                    //           AppColors.white,
                                                    //       border:
                                                    //           OutlineInputBorder(
                                                    //         borderRadius:
                                                    //             BorderRadius
                                                    //                 .circular(
                                                    //                     10.0),
                                                    //         borderSide: BorderSide(
                                                    //             color: AppColors
                                                    //                 .offWhite),
                                                    //       ),
                                                    //       enabledBorder:
                                                    //           OutlineInputBorder(
                                                    //         borderRadius:
                                                    //             BorderRadius
                                                    //                 .circular(
                                                    //                     10.0),
                                                    //         borderSide: BorderSide(
                                                    //             color: AppColors
                                                    //                 .offWhite),
                                                    //       ),
                                                    //       focusedBorder:
                                                    //           OutlineInputBorder(
                                                    //         borderRadius:
                                                    //             BorderRadius
                                                    //                 .circular(
                                                    //                     10.0),
                                                    //         borderSide: BorderSide(
                                                    //             color: AppColors
                                                    //                 .offWhite),
                                                    //       ),
                                                    //       labelStyle: TextStyle(
                                                    //           color: AppColors
                                                    //               .offWhite),
                                                    //       suffixIcon: Icon(
                                                    //           Icons.percent,
                                                    //           color: AppColors
                                                    //               .offWhite),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: Container(),
                                                      // TextFormField(
                                                      //   inputFormatters: <TextInputFormatter>[
                                                      //     LengthLimitingTextInputFormatter(
                                                      //         10),
                                                      //     FilteringTextInputFormatter
                                                      //         .allow(RegExp(
                                                      //             "[0-9,.]")),
                                                      //   ],
                                                      //   controller: controller
                                                      //       .ndp_low.value,
                                                      //   keyboardType:
                                                      //       TextInputType
                                                      //           .number,
                                                      //   onChanged: (value) =>
                                                      //       {},
                                                      //   validator: (text) {
                                                      //     if (text!.isEmpty) {
                                                      //       return '';
                                                      //     }
                                                      //     return null;
                                                      //   },
                                                      //   decoration:
                                                      //       InputDecoration(
                                                      //     errorStyle:
                                                      //         const TextStyle(
                                                      //             height: 0),
                                                      //     isDense: true,
                                                      //     contentPadding:
                                                      //         EdgeInsets
                                                      //             .fromLTRB(
                                                      //                 10,
                                                      //                 20,
                                                      //                 10,
                                                      //                 0),
                                                      //     floatingLabelBehavior:
                                                      //         FloatingLabelBehavior
                                                      //             .never,
                                                      //     filled: true,
                                                      //     fillColor:
                                                      //         AppColors.white,
                                                      //     border:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     enabledBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     focusedBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     labelStyle: TextStyle(
                                                      //         color: AppColors
                                                      //             .offWhite),
                                                      //     suffixIcon: Icon(
                                                      //         Icons.percent,
                                                      //         color: AppColors
                                                      //             .offWhite),
                                                      //   ),
                                                      // ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: Container(),
                                                      // TextFormField(
                                                      //   inputFormatters: <TextInputFormatter>[
                                                      //     LengthLimitingTextInputFormatter(
                                                      //         10),
                                                      //     FilteringTextInputFormatter
                                                      //         .allow(RegExp(
                                                      //             "[0-9,.]")),
                                                      //   ],
                                                      //   controller: controller
                                                      //       .ndp_lowlow.value,
                                                      //   keyboardType:
                                                      //       TextInputType
                                                      //           .number,
                                                      //   onChanged: (value) =>
                                                      //       {},
                                                      //   validator: (text) {
                                                      //     if (text!.isEmpty) {
                                                      //       return '';
                                                      //     }
                                                      //     return null;
                                                      //   },
                                                      //   decoration:
                                                      //       InputDecoration(
                                                      //     errorStyle:
                                                      //         const TextStyle(
                                                      //             height: 0),
                                                      //     isDense: true,
                                                      //     contentPadding:
                                                      //         EdgeInsets
                                                      //             .fromLTRB(
                                                      //                 10,
                                                      //                 20,
                                                      //                 10,
                                                      //                 0),
                                                      //     floatingLabelBehavior:
                                                      //         FloatingLabelBehavior
                                                      //             .never,
                                                      //     filled: true,
                                                      //     fillColor:
                                                      //         AppColors.white,
                                                      //     border:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     enabledBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     focusedBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10.0),
                                                      //       borderSide: BorderSide(
                                                      //           color: AppColors
                                                      //               .offWhite),
                                                      //     ),
                                                      //     labelStyle: TextStyle(
                                                      //         color: AppColors
                                                      //             .offWhite),
                                                      //     suffixIcon: Icon(
                                                      //         Icons.percent,
                                                      //         color: AppColors
                                                      //             .offWhite),
                                                      //   ),
                                                      // ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Checkbox(
                                                      value: true,
                                                      onChanged: (bool? value) {
                                                        // controller.userAccess(
                                                        //     controller
                                                        //         .userManagementListModel!
                                                        //         .data![index]
                                                        //         .emailID
                                                        //         .toString(),
                                                        //     controller
                                                        //         .userManagementListModel!
                                                        //         .data![index]
                                                        //         .plant
                                                        //         .toString(),
                                                        //     value);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 30),
                                                // Row(
                                                //   children: [
                                                //     const SizedBox(
                                                //       height: 50,
                                                //       width: 120,
                                                //       child: Align(
                                                //           alignment: Alignment
                                                //               .centerLeft,
                                                //           child: Text(
                                                //             'Energy',
                                                //             style: TextStyle(
                                                //                 fontSize: 14,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .bold),
                                                //           )),
                                                //     ),
                                                //     const SizedBox(width: 20),
                                                //     SizedBox(
                                                //       height: 40,
                                                //       width: 150,
                                                //       child: TextFormField(
                                                //         inputFormatters: <TextInputFormatter>[
                                                //           LengthLimitingTextInputFormatter(
                                                //               10),
                                                //           FilteringTextInputFormatter
                                                //               .allow(RegExp(
                                                //                   "[0-9,.]")),
                                                //         ],
                                                //         controller: controller
                                                //             .energy_highhigh
                                                //             .value,
                                                //         keyboardType:
                                                //             TextInputType
                                                //                 .number,
                                                //         onChanged: (value) =>
                                                //             {},
                                                //         validator: (text) {
                                                //           if (text!.isEmpty) {
                                                //             return '';
                                                //           }
                                                //           return null;
                                                //         },
                                                //         decoration:
                                                //             InputDecoration(
                                                //           errorStyle:
                                                //               const TextStyle(
                                                //                   height: 0),
                                                //           isDense: true,
                                                //           contentPadding:
                                                //               EdgeInsets
                                                //                   .fromLTRB(
                                                //                       10,
                                                //                       20,
                                                //                       10,
                                                //                       0),
                                                //           floatingLabelBehavior:
                                                //               FloatingLabelBehavior
                                                //                   .never,
                                                //           filled: true,
                                                //           fillColor:
                                                //               AppColors.white,
                                                //           border:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           enabledBorder:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           focusedBorder:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           labelStyle: TextStyle(
                                                //               color: AppColors
                                                //                   .offWhite),
                                                //           suffixIcon: Icon(
                                                //               Icons.percent,
                                                //               color: AppColors
                                                //                   .offWhite),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     const SizedBox(width: 20),
                                                //     SizedBox(
                                                //       height: 40,
                                                //       width: 150,
                                                //       child: TextFormField(
                                                //         inputFormatters: <TextInputFormatter>[
                                                //           LengthLimitingTextInputFormatter(
                                                //               10),
                                                //           FilteringTextInputFormatter
                                                //               .allow(RegExp(
                                                //                   "[0-9,.]")),
                                                //         ],
                                                //         controller: controller
                                                //             .energy_high.value,
                                                //         keyboardType:
                                                //             TextInputType
                                                //                 .number,
                                                //         onChanged: (value) =>
                                                //             {},
                                                //         validator: (text) {
                                                //           if (text!.isEmpty) {
                                                //             return '';
                                                //           }
                                                //           return null;
                                                //         },
                                                //         decoration:
                                                //             InputDecoration(
                                                //           errorStyle:
                                                //               const TextStyle(
                                                //                   height: 0),
                                                //           isDense: true,
                                                //           contentPadding:
                                                //               EdgeInsets
                                                //                   .fromLTRB(
                                                //                       10,
                                                //                       20,
                                                //                       10,
                                                //                       0),
                                                //           floatingLabelBehavior:
                                                //               FloatingLabelBehavior
                                                //                   .never,
                                                //           filled: true,
                                                //           fillColor:
                                                //               AppColors.white,
                                                //           border:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           enabledBorder:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           focusedBorder:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           labelStyle: TextStyle(
                                                //               color: AppColors
                                                //                   .offWhite),
                                                //           suffixIcon: Icon(
                                                //               Icons.percent,
                                                //               color: AppColors
                                                //                   .offWhite),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     const SizedBox(width: 20),
                                                //     SizedBox(
                                                //       height: 40,
                                                //       width: 150,
                                                //       child: TextFormField(
                                                //         inputFormatters: <TextInputFormatter>[
                                                //           LengthLimitingTextInputFormatter(
                                                //               10),
                                                //           FilteringTextInputFormatter
                                                //               .allow(RegExp(
                                                //                   "[0-9,.]")),
                                                //         ],
                                                //         controller: controller
                                                //             .energy_reference
                                                //             .value,
                                                //         keyboardType:
                                                //             TextInputType
                                                //                 .number,
                                                //         onChanged: (value) =>
                                                //             {},
                                                //         validator: (text) {
                                                //           if (text!.isEmpty) {
                                                //             return '';
                                                //           }
                                                //           return null;
                                                //         },
                                                //         decoration:
                                                //             InputDecoration(
                                                //           errorStyle:
                                                //               const TextStyle(
                                                //                   height: 0),
                                                //           isDense: true,
                                                //           contentPadding:
                                                //               EdgeInsets
                                                //                   .fromLTRB(
                                                //                       10,
                                                //                       20,
                                                //                       10,
                                                //                       0),
                                                //           floatingLabelBehavior:
                                                //               FloatingLabelBehavior
                                                //                   .never,
                                                //           filled: true,
                                                //           fillColor:
                                                //               AppColors.white,
                                                //           border:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           enabledBorder:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           focusedBorder:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           labelStyle: TextStyle(
                                                //               color: AppColors
                                                //                   .offWhite),
                                                //           suffixIcon: Icon(
                                                //               Icons.percent,
                                                //               color: AppColors
                                                //                   .offWhite),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     const SizedBox(width: 20),
                                                //     SizedBox(
                                                //       height: 40,
                                                //       width: 150,
                                                //       child: TextFormField(
                                                //         inputFormatters: <TextInputFormatter>[
                                                //           LengthLimitingTextInputFormatter(
                                                //               10),
                                                //           FilteringTextInputFormatter
                                                //               .allow(RegExp(
                                                //                   "[0-9,.]")),
                                                //         ],
                                                //         controller: controller
                                                //             .energy_low.value,
                                                //         keyboardType:
                                                //             TextInputType
                                                //                 .number,
                                                //         onChanged: (value) =>
                                                //             {},
                                                //         validator: (text) {
                                                //           if (text!.isEmpty) {
                                                //             return '';
                                                //           }
                                                //           return null;
                                                //         },
                                                //         decoration:
                                                //             InputDecoration(
                                                //           errorStyle:
                                                //               const TextStyle(
                                                //                   height: 0),
                                                //           isDense: true,
                                                //           contentPadding:
                                                //               EdgeInsets
                                                //                   .fromLTRB(
                                                //                       10,
                                                //                       20,
                                                //                       10,
                                                //                       0),
                                                //           floatingLabelBehavior:
                                                //               FloatingLabelBehavior
                                                //                   .never,
                                                //           filled: true,
                                                //           fillColor:
                                                //               AppColors.white,
                                                //           border:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           enabledBorder:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           focusedBorder:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           labelStyle: TextStyle(
                                                //               color: AppColors
                                                //                   .offWhite),
                                                //           suffixIcon: Icon(
                                                //               Icons.percent,
                                                //               color: AppColors
                                                //                   .offWhite),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     const SizedBox(width: 20),
                                                //     SizedBox(
                                                //       height: 40,
                                                //       width: 150,
                                                //       child: TextFormField(
                                                //         inputFormatters: <TextInputFormatter>[
                                                //           LengthLimitingTextInputFormatter(
                                                //               10),
                                                //           FilteringTextInputFormatter
                                                //               .allow(RegExp(
                                                //                   "[0-9,.]")),
                                                //         ],
                                                //         controller: controller
                                                //             .energy_lowlow
                                                //             .value,
                                                //         keyboardType:
                                                //             TextInputType
                                                //                 .number,
                                                //         onChanged: (value) =>
                                                //             {},
                                                //         validator: (text) {
                                                //           if (text!.isEmpty) {
                                                //             return '';
                                                //           }
                                                //           return null;
                                                //         },
                                                //         decoration:
                                                //             InputDecoration(
                                                //           errorStyle:
                                                //               const TextStyle(
                                                //                   height: 0),
                                                //           isDense: true,
                                                //           contentPadding:
                                                //               const EdgeInsets
                                                //                   .fromLTRB(10,
                                                //                   20, 10, 0),
                                                //           floatingLabelBehavior:
                                                //               FloatingLabelBehavior
                                                //                   .never,
                                                //           filled: true,
                                                //           fillColor:
                                                //               AppColors.white,
                                                //           border:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           enabledBorder:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           focusedBorder:
                                                //               OutlineInputBorder(
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         10.0),
                                                //             borderSide: BorderSide(
                                                //                 color: AppColors
                                                //                     .offWhite),
                                                //           ),
                                                //           labelStyle: TextStyle(
                                                //               color: AppColors
                                                //                   .offWhite),
                                                //           suffixIcon: Icon(
                                                //               Icons.percent,
                                                //               color: AppColors
                                                //                   .offWhite),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 35,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 1, 85, 203),
                                  Color.fromARGB(255, 85, 170, 196),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () => {
                                if (controller.setFormkey.currentState!
                                    .validate())
                                  {
                                    print("condition pass ------------->>> "),
                                    controller.updateSetPoint()
                                  }
                                else
                                  {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        Helper()
                                            .snackBar(controller.errorMessage),
                                      )
                                  }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
