import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nitto_app/controllers/user_information.dart';

import '../routes/routes.dart';
import '../utils/app_colors.dart';
import 'include/drawer_menu.dart';

class UserInformation extends StatelessWidget {
  final controller = Get.put(UserInformationController());
  UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.30,
          height: 60,
          child: Image.asset('assets/images/nitto_hyd.png'),
        ),
        actions: [
          IconButton(
            onPressed: () => {controller.logout()},
            icon: Icon(Icons.logout),
          ),
          const SizedBox(width: 10)
        ],
        bottom: TabBar(
          controller: controller.tabController,
          tabs: const [
            Tab(text: 'General Setting'),
            Tab(text: 'User Preferences'),
            Tab(text: 'Contact Details')
          ],
        ),
      ),
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
          TabBarView(
            controller: controller.tabController,
            children: [generalSetting(), userPreferance(), contactDetails()],
          ),
        ],
      ),
    );
  }

  Widget generalSetting() {
    return SingleChildScrollView(
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
                    "General Setting",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.indigo[900],
                    ),
                  ),
                  Text(
                    GetStorage().read('gs_login_data')['companyName'],
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
          const SizedBox(height: 30),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     TextButton(
          //       onPressed: () =>
          //           {controller.changeUserDetailsVisibility('userDetail')},
          //       child: const Text("User Details"),
          //     ),
          //     TextButton(
          //       onPressed: () =>
          //           {controller.changeUserDetailsVisibility('changePassword')},
          //       child: const Text("Change Password"),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 10),
          Obx(
            () => controller.isUserDetails.isTrue
                ? SizedBox(
                    height: MediaQuery.of(Get.context!).size.height * 0.70,
                    width: MediaQuery.of(Get.context!).size.width * 0.95,
                    child: Card(
                      margin: const EdgeInsets.all(16),
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 137, 226, 253)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 14, left: 8, right: 8, bottom: 14),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => {
                                    controller.changeUserDetailsVisibility(
                                        "changePassword")
                                  },
                                  child: Text(
                                    "Change Password",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 3,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo[900],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Obx(
                                () => Form(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Email ID",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        readOnly: true,
                                        keyboardType: TextInputType.text,
                                        inputFormatters: <TextInputFormatter>[
                                          LengthLimitingTextInputFormatter(50),
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9a-zA-Z,@,.]")),
                                        ],
                                        onChanged: (s) => {},
                                        controller:
                                            controller.emailController.value,
                                        validator: (text) {
                                          if (text!.isEmpty) {}
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          filled: true,
                                          fillColor: Colors.grey[300],
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          labelStyle: TextStyle(
                                              color: AppColors.offWhite),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        const Text(
                                          "Name",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        // controller.isNameEditable.isFalse
                                        //     ? IconButton(
                                        //         onPressed: () => {
                                        //               controller
                                        //                   .updateProfile('name')
                                        //             },
                                        //         icon: Icon(Icons.check))
                                        //     : Container(),
                                        // IconButton(
                                        //     onPressed: () => {
                                        //           controller.isNameEditable
                                        //                   .value =
                                        //               !controller
                                        //                   .isNameEditable.value
                                        //         },
                                        //     icon: Icon(Icons.edit, size: 20))
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        // readOnly:
                                        //     controller.isNameEditable.value,
                                        keyboardType: TextInputType.text,
                                        inputFormatters: <TextInputFormatter>[
                                          LengthLimitingTextInputFormatter(50),
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[a-zA-Z0-9]")),
                                        ],
                                        onChanged: (text) => {
                                          if (text.isEmpty || text.length < 3)
                                            {
                                              print("condition true -------> "),
                                              controller.nameErrorMsg.value =
                                                  'Name must be at least 3 characters'
                                            }
                                          else
                                            {
                                              controller.nameErrorMsg.value =
                                                  '',
                                            }
                                        },
                                        controller:
                                            controller.nameController.value,
                                        validator: (text) {
                                          if (text!.isEmpty ||
                                              text.length < 3) {
                                            return '';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          filled: true,
                                          fillColor: AppColors.white,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          labelStyle: TextStyle(
                                              color: AppColors.offWhite),
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => controller.nameErrorMsg.value == ''
                                          ? const SizedBox(height: 20)
                                          : Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Text(
                                                  controller.nameErrorMsg.value,
                                                  style: const TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Mobile",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        // const SizedBox(width: 10),
                                        // controller.isMobileEditable.isFalse
                                        //     ? IconButton(
                                        //         onPressed: () => {
                                        //               controller.updateProfile(
                                        //                   'mobile')
                                        //             },
                                        //         icon: Icon(Icons.check))
                                        //     : Container(),
                                        // IconButton(
                                        //     onPressed: () => {
                                        //           controller.isMobileEditable
                                        //                   .value =
                                        //               !controller
                                        //                   .isMobileEditable
                                        //                   .value
                                        //         },
                                        //     icon: Icon(
                                        //       Icons.edit,
                                        //       size: 20,
                                        //     ))
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        // readOnly:
                                        //     controller.isMobileEditable.value,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          LengthLimitingTextInputFormatter(10),
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]")),
                                        ],
                                        onChanged: (text) => {
                                          print("----------->>> ${text[0]}"),
                                          if (text[0] == '0' && text.isNotEmpty)
                                            {
                                              controller.mobileErrorMsg.value =
                                                  'Mobile Number should not start with zeros'
                                            }
                                          else if (text.length < 8)
                                            {
                                              controller.mobileErrorMsg.value =
                                                  'Mobile Number must be at least 8 numbers'
                                            }
                                          else
                                            {
                                              controller.mobileErrorMsg.value =
                                                  ''
                                            }
                                        },
                                        controller:
                                            controller.mobileController.value,
                                        validator: (text) {
                                          if (text!.isEmpty ||
                                              text.length != 10) {
                                            return 'enter valid data';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          filled: true,
                                          fillColor: AppColors.white,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: AppColors.offWhite),
                                          ),
                                          labelStyle: TextStyle(
                                              color: AppColors.offWhite),
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => controller.mobileErrorMsg.value ==
                                              ''
                                          ? const SizedBox(height: 10)
                                          : Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Text(
                                                  controller
                                                      .mobileErrorMsg.value,
                                                  style: const TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () async {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 18, 75, 154),
                                              Color.fromARGB(255, 84, 116, 161),
                                            ],
                                          )),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          controller.updateProfile('mobile');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(Get.context!).size.height * 0.70,
                    width: MediaQuery.of(Get.context!).size.width * 0.95,
                    child: Card(
                      margin: const EdgeInsets.all(16),
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 137, 226, 253)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 14, left: 8, right: 8, bottom: 14),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () => {
                                          controller
                                              .changeUserDetailsVisibility(
                                                  "userDetail")
                                        },
                                    child: Text(
                                      "User Details",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 3,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo[900],
                                      ),
                                    ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Obx(
                                () => Form(
                                  key: controller.passwordUpdateFormKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Current Password *",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        height: 50,
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          inputFormatters: <TextInputFormatter>[
                                            LengthLimitingTextInputFormatter(
                                                21),
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[0-9a-zA-Z,@,.]")),
                                          ],
                                          onChanged: (s) => {},
                                          controller: controller
                                              .currentPassController.value,
                                          validator: (text) {
                                            if (text!.isEmpty) {
                                              controller.currentPasswordErrorMsg
                                                  .value = 'Password Required';
                                              return;
                                            }
                                            controller.currentPasswordErrorMsg
                                                .value = '';
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.offWhite),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => controller.currentPasswordErrorMsg
                                                    .value ==
                                                ''
                                            ? const SizedBox(height: 20)
                                            : Text(
                                                controller
                                                    .currentPasswordErrorMsg
                                                    .value,
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              ),
                                      ),
                                      Text(
                                        "New Password *",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        height: 50,
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          inputFormatters: <TextInputFormatter>[
                                            LengthLimitingTextInputFormatter(
                                                21),
                                            // FilteringTextInputFormatter.allow(
                                            //     RegExp("[a-zA-Z]")),
                                          ],
                                          onChanged: (s) => {},
                                          controller: controller
                                              .newPassController.value,
                                          validator: (text) {
                                            if (text!.isEmpty &&
                                                text.length > 7 &&
                                                !RegExp(r'[A-Z0-9]')
                                                    .hasMatch(text) &&
                                                !RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                                    .hasMatch(text)) {
                                              controller.newPasswordErrorMsg
                                                      .value =
                                                  'Password must contain at least 8 alphanumerlic values with one special character';
                                              return;
                                            } else if (controller
                                                    .validateStructure(text) ==
                                                false) {
                                              controller.newPasswordErrorMsg
                                                      .value =
                                                  'Password must contain at least 8 alphanumeric values with one special character';
                                              return;
                                            }
                                            controller
                                                .newPasswordErrorMsg.value = '';
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            filled: true,
                                            fillColor: AppColors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.offWhite),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => controller.newPasswordErrorMsg
                                                    .value ==
                                                ''
                                            ? const SizedBox(height: 20)
                                            : Text(
                                                controller
                                                    .newPasswordErrorMsg.value,
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              ),
                                      ),
                                      Text(
                                        "Confirm Password *",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        height: 50,
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          inputFormatters: <TextInputFormatter>[
                                            LengthLimitingTextInputFormatter(
                                                21),
                                            // FilteringTextInputFormatter.allow(
                                            //     RegExp("[0-9]")),
                                          ],
                                          controller: controller
                                              .confirmPassController.value,
                                          validator: (text) {
                                            if (text !=
                                                controller.newPassController
                                                    .value.text) {
                                              controller.confirmPasswordErrorMsg
                                                      .value =
                                                  'Password must match';
                                              return;
                                            }
                                            controller.confirmPasswordErrorMsg
                                                .value = '';
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            filled: true,
                                            fillColor: AppColors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: AppColors.offWhite),
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.offWhite),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => controller.confirmPasswordErrorMsg
                                                    .value ==
                                                ''
                                            ? const SizedBox(height: 20)
                                            : Text(
                                                controller
                                                    .confirmPasswordErrorMsg
                                                    .value,
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              ),
                                      ),
                                      SizedBox(height: 40),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30),
                                              ),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () async {},
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
                                                "Cancel",
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Container(
                                            height: 30,
                                            width: 100,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30),
                                                ),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        255, 18, 75, 154),
                                                    Color.fromARGB(
                                                        255, 84, 116, 161),
                                                  ],
                                                )),
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                print(
                                                    "--------------> ${controller.passwordUpdateFormKey.currentState!.validate()}");
                                                print(controller
                                                    .currentPasswordErrorMsg);
                                                print(controller
                                                    .newPasswordErrorMsg);
                                                print(controller
                                                    .currentPasswordErrorMsg);
                                                if (controller
                                                        .currentPasswordErrorMsg
                                                        .isEmpty &&
                                                    controller
                                                        .newPasswordErrorMsg
                                                        .isEmpty &&
                                                    controller
                                                        .confirmPasswordErrorMsg
                                                        .isEmpty) {
                                                  controller.updatePassword();
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
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Widget userPreferance() {
    return Column(
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
                  "User Preferences",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.indigo[900],
                  ),
                ),
                Text(
                  GetStorage().read('gs_login_data')['companyName'],
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("Coming Soon"),
            ),
          ],
        )
      ],
    );
  }

  Widget contactDetails() {
    return Column(
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
                  "Contact Details",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.indigo[900],
                  ),
                ),
                Text(
                  GetStorage().read('gs_login_data')['companyName'],
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("Coming Soon"),
            ),
          ],
        )
      ],
    );
  }
}
