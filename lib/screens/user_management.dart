import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/user_management_controller.dart';
import '../utils/app_colors.dart';
import '../utils/helper.dart';
import 'include/app_bar.dart';
import 'include/drawer_menu.dart';

class UserManagement extends StatelessWidget {
  final controller = Get.put(UserManagementController());
  UserManagement({super.key});

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
                                "User Management",
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
                                      top: 20, left: 14, right: 14, bottom: 40),
                                  child: Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Form(
                                          key: controller.userManagekey,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                "Name",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                    width: 200,
                                                    child: TextFormField(
                                                      controller: controller
                                                          .nameController.value,
                                                      validator: (text) {
                                                        if (text!.isEmpty ||
                                                            text.length < 3) {
                                                          print(
                                                              "condition true -------> ");
                                                          controller
                                                                  .nameErrorMsg
                                                                  .value =
                                                              'Name must be at least 3 characters';
                                                          return '';
                                                        } else if (text.length >
                                                            39) {
                                                          controller
                                                                  .nameErrorMsg
                                                                  .value =
                                                              'Name must be Maximum 40 characters';
                                                          return '';
                                                        } else {
                                                          controller
                                                              .nameErrorMsg
                                                              .value = '';
                                                        }

                                                        return null;
                                                      },
                                                      inputFormatters: <TextInputFormatter>[
                                                        LengthLimitingTextInputFormatter(
                                                            40),
                                                        // You might want to adjust or remove the FilteringTextInputFormatter
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                "[a-zA-Z]")),
                                                      ],
                                                      keyboardType:
                                                          TextInputType.name,
                                                      onChanged: (text) => {
                                                        if (text.isEmpty ||
                                                            text.length < 3)
                                                          {
                                                            print(
                                                                "condition true -------> "),
                                                            controller
                                                                    .nameErrorMsg
                                                                    .value =
                                                                'Name must be at least 3 characters'
                                                          }
                                                        else if (text.length >
                                                            39)
                                                          {
                                                            controller
                                                                    .nameErrorMsg
                                                                    .value =
                                                                'Name must be Maximum 40 characters'
                                                          }
                                                        else
                                                          {
                                                            controller
                                                                .nameErrorMsg
                                                                .value = '',
                                                          }
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        errorStyle:
                                                            const TextStyle(
                                                                height: 0),
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        filled: true,
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 20, 10, 0),
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
                                                                .black),
                                                      ),
                                                    ),
                                                  ),
                                                  // Obx(
                                                  //   () => controller
                                                  //               .nameErrorMsg
                                                  //               .value ==
                                                  //           ''
                                                  //       ? Container()
                                                  //       : Align(
                                                  //           alignment: Alignment
                                                  //               .centerLeft,
                                                  //           child: Padding(
                                                  //             padding:
                                                  //                 const EdgeInsets
                                                  //                     .only(
                                                  //                     left:
                                                  //                         10.0,
                                                  //                     top: 5,
                                                  //                     bottom:
                                                  //                         5),
                                                  //             child: Text(
                                                  //               controller
                                                  //                   .nameErrorMsg
                                                  //                   .value,
                                                  //               style: const TextStyle(
                                                  //                   color: Colors
                                                  //                       .red),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  // ),
                                                ],
                                              ),
                                              const SizedBox(width: 10),
                                              const Text(
                                                "Email",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                    width: 200,
                                                    child: TextFormField(
                                                      controller: controller
                                                          .emailController
                                                          .value,
                                                      validator: (text) {
                                                        if (text!.isEmpty) {
                                                          controller
                                                                  .emailErrorMsg
                                                                  .value =
                                                              'Email required';
                                                          return '';
                                                        } else if (text[0] ==
                                                            '.') {
                                                          controller
                                                                  .emailErrorMsg
                                                                  .value =
                                                              'Invalid email format';
                                                          return '';
                                                        } else {
                                                          controller
                                                              .emailErrorMsg
                                                              .value = '';
                                                        }
                                                        return null;
                                                      },
                                                      keyboardType:
                                                          TextInputType.name,
                                                      inputFormatters: <TextInputFormatter>[
                                                        LengthLimitingTextInputFormatter(
                                                            25),
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                "[0-9a-zA-Z.]")),
                                                      ],
                                                      onChanged:
                                                          (value) async => {
                                                        if (value.isEmpty)
                                                          {
                                                            controller
                                                                    .emailErrorMsg
                                                                    .value =
                                                                'Email required'
                                                          }
                                                        else if (value[0] ==
                                                            '.')
                                                          {
                                                            controller
                                                                    .emailErrorMsg
                                                                    .value =
                                                                'Invalid email format'
                                                          }
                                                        else
                                                          {
                                                            controller
                                                                .emailErrorMsg
                                                                .value = ''
                                                          },
                                                        controller
                                                            .userExistCheck()
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        errorStyle:
                                                            const TextStyle(
                                                                height: 0),
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        filled: true,
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 20, 10, 0),
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
                                                      ),
                                                    ),
                                                  ),
                                                  // Obx(
                                                  //   () => controller
                                                  //               .emailErrorMsg
                                                  //               .value !=
                                                  //           ''
                                                  //       ? Align(
                                                  //           alignment: Alignment
                                                  //               .centerLeft,
                                                  //           child: Padding(
                                                  //             padding:
                                                  //                 const EdgeInsets
                                                  //                     .only(
                                                  //                     left:
                                                  //                         20.0,
                                                  //                     top: 5,
                                                  //                     bottom:
                                                  //                         5),
                                                  //             child: Text(
                                                  //               controller
                                                  //                   .emailErrorMsg
                                                  //                   .value,
                                                  //               style: const TextStyle(
                                                  //                   color: Colors
                                                  //                       .red),
                                                  //             ),
                                                  //           ),
                                                  //         )
                                                  //       : Container(),
                                                  // ),
                                                ],
                                              ),
                                              const Text(
                                                "@tito.org.in",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(width: 10),
                                              const Text(
                                                "Role",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(width: 10),
                                              Card(
                                                elevation:
                                                    3, // Set the elevation as needed
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: SizedBox(
                                                  width:
                                                      120, // Increase the width as needed
                                                  height: 30,
                                                  child:
                                                      DropdownButtonFormField(
                                                    isDense: true,
                                                    isExpanded: true,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 16.0),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        232,
                                                                        232,
                                                                        232),
                                                                width: 1.5),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 1.5),
                                                      ),
                                                    ),
                                                    value: controller
                                                        .roledata.value,
                                                    onChanged: (String? value) {
                                                      controller
                                                              .roledata.value =
                                                          value.toString();
                                                    },
                                                    items: controller.roleArr
                                                        .map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                            value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                "Plant",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(width: 10),
                                              Card(
                                                elevation:
                                                    3, // Set the elevation as needed
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: SizedBox(
                                                  width:
                                                      120, // Increase the width as needed
                                                  height: 30,
                                                  child: GetBuilder(
                                                    init: controller,
                                                    builder: (_) =>
                                                        DropdownButtonFormField(
                                                      isDense: true,
                                                      isExpanded: true,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    16.0),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          232,
                                                                          232,
                                                                          232),
                                                                  width: 1.5),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 1.5),
                                                        ),
                                                      ),
                                                      value:
                                                          controller.plantValue,
                                                      onChanged: (value) {
                                                        controller.plantValue =
                                                            value.toString();
                                                      },
                                                      items: controller
                                                          .plantModel?.data!
                                                          .map(
                                                            (palnt) =>
                                                                DropdownMenuItem(
                                                              value:
                                                                  palnt.plantId,
                                                              child: Tooltip(
                                                                message: palnt
                                                                    .plantName,
                                                                child: Text(
                                                                  "${palnt.plantName}",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
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
                                      ),
                                      SizedBox(height: 30),
                                      Obx(
                                        () => Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Container(
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  gradient: controller.btnEnable
                                                              .value ==
                                                          true
                                                      ? const LinearGradient(
                                                          colors: [
                                                            Color.fromARGB(255,
                                                                1, 85, 203),
                                                            Color.fromARGB(255,
                                                                85, 170, 196),
                                                          ],
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                        )
                                                      : const LinearGradient(
                                                          colors: [
                                                            Color.fromARGB(255,
                                                                96, 122, 159),
                                                            Color.fromARGB(255,
                                                                104, 130, 166),
                                                          ],
                                                        )),
                                              child: ElevatedButton(
                                                onPressed:
                                                    controller.btnEnable.isFalse
                                                        ? null
                                                        : () => {
                                                              // if (controller
                                                              //     .userManagekey
                                                              //     .currentState!
                                                              //     .validate())
                                                              //   {
                                                              //     controller
                                                              //         .assignUser(),
                                                              //   }
                                                              if (controller
                                                                  .userManagekey
                                                                  .currentState!
                                                                  .validate())
                                                                {
                                                                  controller
                                                                      .assignUser(),
                                                                }
                                                              else
                                                                {
                                                                  ScaffoldMessenger
                                                                      .of(context)
                                                                    ..hideCurrentSnackBar()
                                                                    ..showSnackBar(
                                                                      Helper()
                                                                          .snackBar(
                                                                        controller.nameErrorMsg.value !=
                                                                                ''
                                                                            ? controller.nameErrorMsg.value
                                                                            : controller.emailErrorMsg.value,
                                                                      ),
                                                                    )
                                                                }
                                                            },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                                child: Obx(
                                                  () => Text(
                                                    controller
                                                            .isUserExist.isFalse
                                                        ? "Send Invite"
                                                        : "Assign",
                                                    style: TextStyle(
                                                      color: AppColors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.50,
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
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: GetBuilder(
                                    init: controller,
                                    builder: (_) => controller
                                                .userManagementListModel !=
                                            null
                                        ? DataTable(
                                            // Datatable widget that have the property columns and rows.
                                            columns: const [
                                              // Set the name of the column
                                              DataColumn(
                                                label: Text('Name'),
                                              ),
                                              DataColumn(
                                                label: Text('E-Mail ID'),
                                              ),
                                              DataColumn(
                                                label: Text('Role'),
                                              ),
                                              DataColumn(
                                                label: Text('Plant'),
                                              ),
                                              DataColumn(
                                                label: Text('Access'),
                                              ),
                                            ],
                                            rows: List.generate(
                                              controller
                                                  .userManagementListModel!
                                                  .data!
                                                  .length,
                                              (index) => DataRow(
                                                cells: [
                                                  DataCell(Text(controller
                                                      .userManagementListModel!
                                                      .data![index]
                                                      .name
                                                      .toString())),
                                                  DataCell(Text(controller
                                                      .userManagementListModel!
                                                      .data![index]
                                                      .emailID
                                                      .toString())),
                                                  DataCell(Text(controller
                                                      .userManagementListModel!
                                                      .data![index]
                                                      .role
                                                      .toString())),
                                                  DataCell(Text(controller
                                                      .userManagementListModel!
                                                      .data![index]
                                                      .plant
                                                      .toString())),
                                                  DataCell(
                                                    Checkbox(
                                                      value: controller
                                                          .userManagementListModel!
                                                          .data![index]
                                                          .isActive,
                                                      onChanged: (bool? value) {
                                                        controller.userAccess(
                                                            controller
                                                                .userManagementListModel!
                                                                .data![index]
                                                                .emailID
                                                                .toString(),
                                                            controller
                                                                .userManagementListModel!
                                                                .data![index]
                                                                .plant
                                                                .toString(),
                                                            value);
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : Center(
                                            child: const Align(
                                              alignment: Alignment.center,
                                              child: Text("No Data Found"),
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
          ),
        ],
      ),
    );
  }
}
