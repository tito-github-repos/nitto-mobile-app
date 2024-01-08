import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                                "Corporate / OEM name",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.indigo[900],
                                ),
                              ),
                              Text(
                                "Company name",
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
                                              SizedBox(
                                                height: 50,
                                                width: 150,
                                                child: TextFormField(
                                                  controller: controller
                                                      .nameController.value,
                                                  validator: (text) {
                                                    if (text!.isEmpty) {
                                                      return 'Name required ';
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.name,
                                                  onChanged: (value) => {},
                                                  decoration: InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    filled: true,
                                                    fillColor: AppColors.white,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: AppColors
                                                              .offWhite),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: AppColors
                                                              .offWhite),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: AppColors
                                                              .offWhite),
                                                    ),
                                                    labelStyle: TextStyle(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                ),
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
                                              SizedBox(
                                                height: 50,
                                                width: 150,
                                                child: TextFormField(
                                                  controller: controller
                                                      .emailController.value,
                                                  validator: (text) {
                                                    if (text!.isEmpty) {
                                                      return 'Email required ';
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.name,
                                                  onChanged: (value) async => {
                                                    Timer(
                                                        const Duration(
                                                            seconds: 3), () {
                                                      controller
                                                          .userExistCheck();
                                                    })
                                                  },
                                                  decoration: InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    filled: true,
                                                    fillColor: AppColors.white,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: AppColors
                                                              .offWhite),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: AppColors
                                                              .offWhite),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: AppColors
                                                              .offWhite),
                                                    ),
                                                    labelStyle: TextStyle(
                                                        color:
                                                            AppColors.offWhite),
                                                  ),
                                                ),
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
                                                          controller.passValue,
                                                      onChanged: (value) {
                                                        controller.passValue =
                                                            value.toString();
                                                      },
                                                      items: controller.roloArr
                                                          .map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          onTap: () => {
                                                            controller.roledata
                                                                .value = value
                                                          },
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                    ),
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
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Container(
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 1, 85, 203),
                                                  Color.fromARGB(
                                                      255, 85, 170, 196),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () => {
                                                if (controller
                                                    .userManagekey.currentState!
                                                    .validate())
                                                  {
                                                    controller.assignUser(),
                                                  }
                                                else
                                                  {
                                                    ScaffoldMessenger.of(
                                                        context)
                                                      ..hideCurrentSnackBar()
                                                      ..showSnackBar(
                                                        Helper().snackBar(
                                                            'please fill all the fields'),
                                                      )
                                                  }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  controller.isUserExist.isFalse
                                                      ? "Send Invite"
                                                      : "Assign",
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
                                    builder: (_) =>
                                        controller.userManagementListModel !=
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
                                                          value: true,
                                                          onChanged:
                                                              (bool? value) {},
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
