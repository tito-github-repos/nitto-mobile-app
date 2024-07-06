import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nitto_app/controllers/home_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../models/graph_model.dart';
import 'include/app_bar.dart';
import 'include/drawer_menu.dart';

class Home extends StatelessWidget {
  final controller = Get.put(HomeConroller());
  Home({super.key});

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
                                "Dashboard",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 3, // Set the elevation as needed
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    width: 180,
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
                                              .toList()),
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 3, // Set the elevation as needed
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    width: 180, // Increase the width as needed
                                    height: 30,
                                    child: GetBuilder(
                                      init: controller,
                                      builder: (_) => controller.trainModel !=
                                              null
                                          ? DropdownButtonFormField(
                                              isDense: true,
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: const BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 232, 232, 232),
                                                      width: 1.5),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: const BorderSide(
                                                      color: Colors.red,
                                                      width: 1.5),
                                                ),
                                              ),
                                              value: controller.trainValue,
                                              onChanged: (value) {
                                                print(
                                                    "train value ----------->>> $value");
                                                controller.trainValue =
                                                    value.toString();
                                              },
                                              items: controller.trainModel!.data
                                                  .map(
                                                    (train) => DropdownMenuItem(
                                                      value: train.trainId,
                                                      child: Tooltip(
                                                        message:
                                                            train.trainName,
                                                        child: Text(
                                                          "${train.trainName}",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList())
                                          : DropdownButtonFormField(
                                              isDense: true,
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: const BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 232, 232, 232),
                                                      width: 1.5),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                              },
                                              items: controller.dropdownItems),
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: Container(
                                //     height: 35,
                                //     decoration: const BoxDecoration(
                                //       borderRadius: BorderRadius.all(
                                //         Radius.circular(30),
                                //       ),
                                //       gradient: LinearGradient(
                                //         colors: [
                                //           Color.fromARGB(255, 1, 85, 203),
                                //           Color.fromARGB(255, 85, 170, 196),
                                //         ],
                                //         begin: Alignment.topCenter,
                                //         end: Alignment.bottomCenter,
                                //       ),
                                //     ),
                                //     child: ElevatedButton(
                                //       onPressed: null,
                                //       style: ElevatedButton.styleFrom(
                                //         backgroundColor: Colors.transparent,
                                //         shadowColor: Colors.transparent,
                                //         shape: RoundedRectangleBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(30),
                                //         ),
                                //       ),
                                //       child: Text(
                                //         "Download Summary",
                                //         style: TextStyle(
                                //           color: AppColors.white,
                                //           fontWeight: FontWeight.w600,
                                //           fontSize: 12,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 250,
                              child: Card(
                                margin: const EdgeInsets.all(16),
                                color: Colors.white,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 27, 35, 130)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 14, left: 8, right: 8, bottom: 14),
                                  child: Column(
                                    children: [
                                      Text(
                                        "STAGE-Stage 1",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo[900],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 50,
                                                    width: 70,
                                                    child: SfRadialGauge(
                                                      axes: <RadialAxis>[
                                                        RadialAxis(
                                                          showTicks: false,
                                                          showLabels: false,
                                                          minimum: 0,
                                                          maximum: 150,
                                                          ranges: <GaugeRange>[
                                                            GaugeRange(
                                                                startValue: 0,
                                                                endValue: 75,
                                                                color: Colors
                                                                    .blue[200]),
                                                          ],
                                                          // pointers: const <GaugePointer>[
                                                          //   NeedlePointer(value: 75)
                                                          // ],
                                                          // annotations: <GaugeAnnotation>[
                                                          //   GaugeAnnotation(
                                                          //       widget: Container(),
                                                          //       angle: 90,
                                                          //       positionFactor: 0.5)
                                                          // ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 5,
                                                        width: 5,
                                                        color: Colors.blue[200],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      const Text("NSP")
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 50,
                                                    width: 70,
                                                    child: SfRadialGauge(
                                                      axes: <RadialAxis>[
                                                        RadialAxis(
                                                          showTicks: false,
                                                          showLabels: false,
                                                          minimum: 0,
                                                          maximum: 150,
                                                          ranges: <GaugeRange>[
                                                            GaugeRange(
                                                                startValue: 0,
                                                                endValue: 75,
                                                                color: Colors
                                                                    .blue[200]),
                                                          ],
                                                          // pointers: const <GaugePointer>[
                                                          //   NeedlePointer(value: 75)
                                                          // ],
                                                          // annotations: <GaugeAnnotation>[
                                                          //   GaugeAnnotation(
                                                          //       widget: Container(),
                                                          //       angle: 90,
                                                          //       positionFactor: 0.5)
                                                          // ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 5,
                                                        width: 5,
                                                        color: Colors.blue[200],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      const Text("NPF")
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 50,
                                                    width: 70,
                                                    child: SfRadialGauge(
                                                      axes: <RadialAxis>[
                                                        RadialAxis(
                                                          showTicks: false,
                                                          showLabels: false,
                                                          minimum: 0,
                                                          maximum: 150,
                                                          ranges: <GaugeRange>[
                                                            GaugeRange(
                                                                startValue: 0,
                                                                endValue: 75,
                                                                color: Colors
                                                                    .blue[200]),
                                                          ],
                                                          // pointers: const <GaugePointer>[
                                                          //   NeedlePointer(value: 75)
                                                          // ],
                                                          // annotations: <GaugeAnnotation>[
                                                          //   GaugeAnnotation(
                                                          //       widget: Container(),
                                                          //       angle: 90,
                                                          //       positionFactor: 0.5)
                                                          // ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 5,
                                                        width: 5,
                                                        color: Colors.blue[200],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      const Text("NDP")
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 250,
                              child: Card(
                                margin: const EdgeInsets.all(16),
                                color: Colors.white,
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
                                      top: 14, left: 8, right: 8, bottom: 14),
                                  child: Column(
                                    children: [
                                      Text(
                                        "STAGE-Stage 2",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo[900],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "No record found",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
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
                      GetBuilder(
                        init: controller,
                        builder: (_) => SizedBox(
                          // height: controller.graphData != null ? 1650 : 400,
                          height: controller.graphData != null ? 1650 : 300,
                          width: double.infinity,
                          child: Card(
                            margin: const EdgeInsets.all(16.0),
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
                                  top: 8, left: 14, right: 14, bottom: 28),
                              child: SingleChildScrollView(
                                child: GetBuilder(
                                  init: controller,
                                  builder: (_) => Column(
                                    children: [
                                      Obx(
                                        () => SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Radio(
                                                value: 1,
                                                groupValue: controller
                                                    .selectedValue.value,
                                                onChanged: (value) {
                                                  controller.setSelectedValue(
                                                      value as int);
                                                },
                                              ),
                                              const Text(
                                                '24 hours',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              Radio(
                                                value: 2,
                                                groupValue: controller
                                                    .selectedValue.value,
                                                onChanged: (value) {
                                                  controller.setSelectedValue(
                                                      value as int);
                                                },
                                              ),
                                              const Text(
                                                'Week',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              Radio(
                                                value: 3,
                                                groupValue: controller
                                                    .selectedValue.value,
                                                onChanged: (value) {
                                                  controller.setSelectedValue(
                                                      value as int);
                                                },
                                              ),
                                              const Text(
                                                'Month',
                                                style:
                                                    TextStyle(fontSize: 14.0),
                                              ),
                                              Radio(
                                                value: 4,
                                                groupValue: controller
                                                    .selectedValue.value,
                                                onChanged: (value) {
                                                  controller.setSelectedValue(
                                                      value as int);
                                                },
                                              ),
                                              const Text(
                                                'Custom',
                                                style:
                                                    TextStyle(fontSize: 14.0),
                                              ),
                                              const SizedBox(width: 10),
                                              GetBuilder(
                                                init: controller,
                                                builder: (_) => Visibility(
                                                  visible: controller
                                                              .selectedValue
                                                              .value ==
                                                          4
                                                      ? true
                                                      : false,
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        'From :',
                                                        style: TextStyle(
                                                            fontSize: 14.0),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 15,
                                                        ),
                                                        child: SizedBox(
                                                          height: 40,
                                                          width: 120,
                                                          child: Obx(
                                                            () => TextField(
                                                              controller:
                                                                  controller
                                                                      .fromDate
                                                                      .value,
                                                              showCursor: false,
                                                              readOnly: true,
                                                              onTap: () => {
                                                                controller
                                                                    .selectDate(
                                                                        'from'),
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                isDense: true,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            5,
                                                                            0,
                                                                            5,
                                                                            -5),
                                                                filled: true,
                                                                suffix: Icon(Icons
                                                                    .calendar_today),
                                                                border:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide.none),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            137,
                                                                            226,
                                                                            253),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      const Text(
                                                        'To :',
                                                        style: TextStyle(
                                                            fontSize: 14.0),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 15,
                                                        ),
                                                        child: SizedBox(
                                                          height: 40,
                                                          width: 120,
                                                          child: Obx(
                                                            () => TextField(
                                                              controller:
                                                                  controller
                                                                      .toDate
                                                                      .value,
                                                              showCursor: false,
                                                              readOnly: true,
                                                              onTap: () => {
                                                                controller
                                                                    .selectDate(
                                                                        'to'),
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                isDense: true,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            5,
                                                                            0,
                                                                            5,
                                                                            -5),
                                                                filled: true,
                                                                suffix: Icon(Icons
                                                                    .calendar_today),
                                                                border:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide.none),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            137,
                                                                            226,
                                                                            253),
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
                                            ],
                                          ),
                                        ),
                                      ),
                                      // GetBuilder(
                                      //     init: controller,
                                      //     builder: (_) =>
                                      //         controller.graphData != null
                                      //             ? SingleChildScrollView(
                                      //                 scrollDirection:
                                      //                     Axis.horizontal,
                                      //                 physics:
                                      //                     const BouncingScrollPhysics(),
                                      //                 child: Row(
                                      //                   mainAxisAlignment:
                                      //                       MainAxisAlignment
                                      //                           .start,
                                      //                   children: [
                                      //                     SizedBox(
                                      //                       width: 600,
                                      //                       height: 300,
                                      //                       child:
                                      //                           SfCartesianChart(
                                      //                         tooltipBehavior:
                                      //                             controller
                                      //                                 .tooltipBehavior,
                                      //                         enableAxisAnimation:
                                      //                             true,
                                      //                         zoomPanBehavior:
                                      //                             controller
                                      //                                 .zoomPanBehavior,
                                      //                         trackballBehavior:
                                      //                             controller
                                      //                                 .trackballBehavior,
                                      //                         title: ChartTitle(
                                      //                           text: controller
                                      //                               .graphData!
                                      //                               .data[0]
                                      //                               .name
                                      //                               .toString(),
                                      //                         ),
                                      //                         primaryYAxis:
                                      //                             NumericAxis(
                                      //                           title:
                                      //                               AxisTitle(
                                      //                                   alignment:
                                      //                                       ChartAlignment
                                      //                                           .far,
                                      //                                   textStyle:
                                      //                                       const TextStyle(
                                      //                                     fontWeight:
                                      //                                         FontWeight.w600,
                                      //                                     fontSize:
                                      //                                         8,
                                      //                                   ),
                                      //                                   text: controller
                                      //                                       .graphData!
                                      //                                       .data[0]
                                      //                                       .name
                                      //                                       .toString()),
                                      //                         ),
                                      //                         primaryXAxis:
                                      //                             CategoryAxis(
                                      //                           title:
                                      //                               AxisTitle(
                                      //                                   alignment:
                                      //                                       ChartAlignment
                                      //                                           .far,
                                      //                                   textStyle:
                                      //                                       const TextStyle(
                                      //                                     fontWeight:
                                      //                                         FontWeight.w600,
                                      //                                     fontSize:
                                      //                                         8,
                                      //                                   ),
                                      //                                   text: controller.graphData!.data[0].reference.isNotEmpty
                                      //                                       ? controller.graphData!.data[0].reference[0].text.toString()
                                      //                                       : ''),
                                      //                         ),
                                      //                         series: <ChartSeries>[
                                      //                           // Grap series
                                      //                           LineSeries<ChartDatum, String>(
                                      //                               enableTooltip:
                                      //                                   true,
                                      //                               isVisible: controller
                                      //                                   .nspIsvisible1
                                      //                                   .value,
                                      //                               dataSource: controller
                                      //                                   .graphData!
                                      //                                   .data[0]
                                      //                                   .chartData,
                                      //                               xValueMapper:
                                      //                                   (ChartDatum gr, _) => gr
                                      //                                       .timeseries
                                      //                                       .toString(),
                                      //                               yValueMapper:
                                      //                                   (ChartDatum gr, _) =>
                                      //                                       gr.normalizedSaltPassage ??
                                      //                                       0,
                                      //                               xAxisName: controller
                                      //                                   .graphData!
                                      //                                   .data[0]
                                      //                                   .name
                                      //                                   .toString(),
                                      //                               color: HexColor(controller
                                      //                                       .graphData!
                                      //                                       .data[0]
                                      //                                       .color
                                      //                                       .isNotEmpty
                                      //                                   ? controller.graphData!.data[0].color[0]
                                      //                                   : '#a83232')),
                                      //                           LineSeries<
                                      //                               ChartDatum,
                                      //                               String>(
                                      //                             enableTooltip:
                                      //                                 true,
                                      //                             isVisible:
                                      //                                 controller
                                      //                                     .trendIsvisible1
                                      //                                     .value,
                                      //                             dataSource: controller
                                      //                                 .graphData!
                                      //                                 .data[0]
                                      //                                 .chartData,
                                      //                             xValueMapper: (ChartDatum
                                      //                                         gr,
                                      //                                     _) =>
                                      //                                 gr.timeseries
                                      //                                     .toString(),
                                      //                             yValueMapper:
                                      //                                 (ChartDatum gr,
                                      //                                         _) =>
                                      //                                     gr.linear ??
                                      //                                     0,
                                      //                             color: HexColor(controller
                                      //                                     .graphData!
                                      //                                     .data[
                                      //                                         0]
                                      //                                     .color
                                      //                                     .isNotEmpty
                                      //                                 ? controller
                                      //                                     .graphData!
                                      //                                     .data[
                                      //                                         0]
                                      //                                     .color[1]
                                      //                                 : '#a83232'),
                                      //                             markerSettings:
                                      //                                 const MarkerSettings(
                                      //                               shape: DataMarkerType
                                      //                                   .verticalLine,
                                      //                               isVisible:
                                      //                                   true,
                                      //                             ),
                                      //                           ),
                                      //                         ],
                                      //                       ),
                                      //                     ),
                                      //                     const SizedBox(
                                      //                         width: 10),
                                      //                     Column(
                                      //                       mainAxisAlignment:
                                      //                           MainAxisAlignment
                                      //                               .start,
                                      //                       children: [
                                      //                         Row(
                                      //                           mainAxisAlignment:
                                      //                               MainAxisAlignment
                                      //                                   .start,
                                      //                           children: [
                                      //                             SizedBox(
                                      //                               height: 20,
                                      //                               width: 20,
                                      //                               child: Card(
                                      //                                 margin: const EdgeInsets
                                      //                                     .all(
                                      //                                     5),
                                      //                                 color: HexColor(controller
                                      //                                         .graphData!
                                      //                                         .data[
                                      //                                             0]
                                      //                                         .color
                                      //                                         .isNotEmpty
                                      //                                     ? controller
                                      //                                         .graphData!
                                      //                                         .data[0]
                                      //                                         .color[0]
                                      //                                     : '#a83232'),
                                      //                                 elevation:
                                      //                                     5,
                                      //                                 shape:
                                      //                                     RoundedRectangleBorder(
                                      //                                   borderRadius:
                                      //                                       BorderRadius.circular(5),
                                      //                                 ),
                                      //                                 child:
                                      //                                     Container(),
                                      //                               ),
                                      //                             ),
                                      //                             InkWell(
                                      //                               onTap: () =>
                                      //                                   {
                                      //                                 controller
                                      //                                     .updateMarkerLine(
                                      //                                         'nsp')
                                      //                               },
                                      //                               child: const Text(
                                      //                                   "Normalised Salt Passage"),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                         Row(
                                      //                           mainAxisAlignment:
                                      //                               MainAxisAlignment
                                      //                                   .start,
                                      //                           children: [
                                      //                             SizedBox(
                                      //                               height: 20,
                                      //                               width: 20,
                                      //                               child: Card(
                                      //                                 margin: const EdgeInsets
                                      //                                     .all(
                                      //                                     5),
                                      //                                 color: HexColor(controller
                                      //                                         .graphData!
                                      //                                         .data[
                                      //                                             0]
                                      //                                         .color
                                      //                                         .isNotEmpty
                                      //                                     ? controller
                                      //                                         .graphData!
                                      //                                         .data[0]
                                      //                                         .color[1]
                                      //                                     : '#a83232'),
                                      //                                 elevation:
                                      //                                     5,
                                      //                                 shape:
                                      //                                     RoundedRectangleBorder(
                                      //                                   borderRadius:
                                      //                                       BorderRadius.circular(5),
                                      //                                 ),
                                      //                                 child:
                                      //                                     Container(),
                                      //                               ),
                                      //                             ),
                                      //                             InkWell(
                                      //                               onTap: () =>
                                      //                                   {
                                      //                                 controller
                                      //                                     .updateMarkerLine(
                                      //                                         'trend')
                                      //                               },
                                      //                               child: const Text(
                                      //                                   "Trend Line"),
                                      //                             )
                                      //                           ],
                                      //                         )
                                      //                       ],
                                      //                     ),
                                      //                     const SizedBox(
                                      //                         width: 10),
                                      //                     SizedBox(
                                      //                       height: MediaQuery.of(
                                      //                                   context)
                                      //                               .size
                                      //                               .height *
                                      //                           0.21,
                                      //                       width: 250,
                                      //                       child: Card(
                                      //                         margin:
                                      //                             const EdgeInsets
                                      //                                 .all(16),
                                      //                         color: const Color
                                      //                             .fromARGB(
                                      //                             255,
                                      //                             231,
                                      //                             247,
                                      //                             255),
                                      //                         elevation: 5,
                                      //                         shape:
                                      //                             RoundedRectangleBorder(
                                      //                           borderRadius:
                                      //                               BorderRadius
                                      //                                   .circular(
                                      //                                       5),
                                      //                           side: const BorderSide(
                                      //                               width: 1,
                                      //                               color: Color
                                      //                                   .fromARGB(
                                      //                                       255,
                                      //                                       0,
                                      //                                       0,
                                      //                                       0)),
                                      //                         ),
                                      //                         child: Padding(
                                      //                           padding:
                                      //                               const EdgeInsets
                                      //                                   .all(
                                      //                                   8.0),
                                      //                           child: Column(
                                      //                             mainAxisAlignment:
                                      //                                 MainAxisAlignment
                                      //                                     .start,
                                      //                             children: [
                                      //                               Row(
                                      //                                 mainAxisAlignment:
                                      //                                     MainAxisAlignment
                                      //                                         .start,
                                      //                                 children: [
                                      //                                   const Text(
                                      //                                     "Mean",
                                      //                                     style: TextStyle(
                                      //                                         fontSize: 18,
                                      //                                         fontWeight: FontWeight.w500),
                                      //                                   ),
                                      //                                   const SizedBox(
                                      //                                       width:
                                      //                                           5),
                                      //                                   Text(
                                      //                                     controller
                                      //                                         .graphData!
                                      //                                         .statisticalData[0]
                                      //                                         .mean
                                      //                                         .toString(),
                                      //                                     style:
                                      //                                         TextStyle(
                                      //                                       color:
                                      //                                           Colors.grey[400],
                                      //                                       fontSize:
                                      //                                           18,
                                      //                                       fontWeight:
                                      //                                           FontWeight.w500,
                                      //                                     ),
                                      //                                   )
                                      //                                 ],
                                      //                               ),
                                      //                               const SizedBox(
                                      //                                   height:
                                      //                                       10),
                                      //                               Row(
                                      //                                 mainAxisAlignment:
                                      //                                     MainAxisAlignment
                                      //                                         .start,
                                      //                                 children: [
                                      //                                   const Text(
                                      //                                     "Min",
                                      //                                     style: TextStyle(
                                      //                                         fontSize: 18,
                                      //                                         fontWeight: FontWeight.w500),
                                      //                                   ),
                                      //                                   const SizedBox(
                                      //                                       width:
                                      //                                           5),
                                      //                                   Text(
                                      //                                     controller
                                      //                                         .graphData!
                                      //                                         .statisticalData[0]
                                      //                                         .min
                                      //                                         .toString(),
                                      //                                     style:
                                      //                                         TextStyle(
                                      //                                       color:
                                      //                                           Colors.grey[400],
                                      //                                       fontSize:
                                      //                                           18,
                                      //                                       fontWeight:
                                      //                                           FontWeight.w500,
                                      //                                     ),
                                      //                                   )
                                      //                                 ],
                                      //                               ),
                                      //                               const SizedBox(
                                      //                                   height:
                                      //                                       10),
                                      //                               Row(
                                      //                                 mainAxisAlignment:
                                      //                                     MainAxisAlignment
                                      //                                         .start,
                                      //                                 children: [
                                      //                                   const Text(
                                      //                                     "MAX",
                                      //                                     style: TextStyle(
                                      //                                         fontSize: 18,
                                      //                                         fontWeight: FontWeight.w500),
                                      //                                   ),
                                      //                                   const SizedBox(
                                      //                                       width:
                                      //                                           5),
                                      //                                   Text(
                                      //                                     controller
                                      //                                         .graphData!
                                      //                                         .statisticalData[0]
                                      //                                         .max
                                      //                                         .toString(),
                                      //                                     style:
                                      //                                         TextStyle(
                                      //                                       color:
                                      //                                           Colors.grey[400],
                                      //                                       fontSize:
                                      //                                           18,
                                      //                                       fontWeight:
                                      //                                           FontWeight.w500,
                                      //                                     ),
                                      //                                   )
                                      //                                 ],
                                      //                               ),
                                      //                               const SizedBox(
                                      //                                   height:
                                      //                                       10),
                                      //                               Row(
                                      //                                 mainAxisAlignment:
                                      //                                     MainAxisAlignment
                                      //                                         .start,
                                      //                                 children: [
                                      //                                   const Text(
                                      //                                     "STD",
                                      //                                     style: TextStyle(
                                      //                                         fontSize: 18,
                                      //                                         fontWeight: FontWeight.w500),
                                      //                                   ),
                                      //                                   const SizedBox(
                                      //                                       width:
                                      //                                           5),
                                      //                                   Text(
                                      //                                     controller
                                      //                                         .graphData!
                                      //                                         .statisticalData[0]
                                      //                                         .std
                                      //                                         .toString(),
                                      //                                     style:
                                      //                                         TextStyle(
                                      //                                       color:
                                      //                                           Colors.grey[400],
                                      //                                       fontSize:
                                      //                                           18,
                                      //                                       fontWeight:
                                      //                                           FontWeight.w500,
                                      //                                     ),
                                      //                                   )
                                      //                                 ],
                                      //                               ),
                                      //                             ],
                                      //                           ),
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               )
                                      //             : Container()),
                                      const SizedBox(height: 10),
                                      GetBuilder(
                                          init: controller,
                                          builder: (_) => controller
                                                          .stageValue !=
                                                      null &&
                                                  controller.fromDate.value.text
                                                      .isNotEmpty &&
                                                  controller.toDate.value.text
                                                      .isNotEmpty &&
                                                  controller.graphData != null
                                              ? SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 900,
                                                        height: 1500,
                                                        // height: controller
                                                        //             .graphData !=
                                                        //         null
                                                        //     ? 1500
                                                        //     : 400,
                                                        child: InAppWebView(
                                                          initialUrlRequest:
                                                              URLRequest(
                                                                  url: Uri.parse(
                                                                      controller
                                                                          .graphUrl)),
                                                          initialOptions:
                                                              InAppWebViewGroupOptions(
                                                            crossPlatform:
                                                                InAppWebViewOptions(),
                                                          ),
                                                          onWebViewCreated:
                                                              (controllerr) {
                                                            controller
                                                                    .webViewController =
                                                                controllerr;
                                                          },
                                                          // gestureRecognizers: Set()
                                                          //   ..add(Factory<
                                                          //           VerticalDragGestureRecognizer>(
                                                          //       () =>
                                                          //           VerticalDragGestureRecognizer())),
                                                          // initialUrlRequest:
                                                          //     URLRequest(
                                                          //         url: Uri.parse(
                                                          //             controller
                                                          //                 .graphUrl)),
                                                          // initialOptions:
                                                          //     InAppWebViewGroupOptions(
                                                          //         crossPlatform:
                                                          //             InAppWebViewOptions()),
                                                          // onWebViewCreated:
                                                          //     (InAppWebViewController
                                                          //         controllerr) {
                                                          //   controller
                                                          //           .webViewController =
                                                          //       controllerr;
                                                          // },
                                                          // onLoadStart:
                                                          //     (controller,
                                                          //         url) {
                                                          //   print(
                                                          //       "Page started loading: $url");
                                                          // },
                                                          // onLoadStop:
                                                          //     (controller,
                                                          //         url) {
                                                          //   print(
                                                          //       "Page finished loading: $url");
                                                          // },
                                                        ),
                                                        // SfCartesianChart(
                                                        //   tooltipBehavior:
                                                        //       controller
                                                        //           .tooltipBehavior,
                                                        //   enableAxisAnimation:
                                                        //       true,
                                                        //   zoomPanBehavior:
                                                        //       controller
                                                        //           .zoomPanBehavior,
                                                        //   trackballBehavior:
                                                        //       controller
                                                        //           .trackballBehavior,
                                                        //   title: ChartTitle(
                                                        //     text: controller
                                                        //         .graphData!
                                                        //         .data[0]
                                                        //         .name
                                                        //         .toString(),
                                                        //   ),
                                                        //   primaryYAxis:
                                                        //       NumericAxis(
                                                        //     title: AxisTitle(
                                                        //         alignment:
                                                        //             ChartAlignment
                                                        //                 .far,
                                                        //         textStyle:
                                                        //             const TextStyle(
                                                        //           fontWeight:
                                                        //               FontWeight
                                                        //                   .w600,
                                                        //           fontSize: 8,
                                                        //         ),
                                                        //         text: controller
                                                        //             .graphData!
                                                        //             .data[0]
                                                        //             .name
                                                        //             .toString()),
                                                        //   ),
                                                        //   primaryXAxis:
                                                        //       CategoryAxis(
                                                        //     title: AxisTitle(
                                                        //         alignment:
                                                        //             ChartAlignment
                                                        //                 .far,
                                                        //         textStyle:
                                                        //             const TextStyle(
                                                        //           fontWeight:
                                                        //               FontWeight
                                                        //                   .w600,
                                                        //           fontSize: 8,
                                                        //         ),
                                                        //         text: controller
                                                        //                 .graphData!
                                                        //                 .data[0]
                                                        //                 .reference
                                                        //                 .isNotEmpty
                                                        //             ? controller
                                                        //                 .graphData!
                                                        //                 .data[0]
                                                        //                 .reference[
                                                        //                     0]
                                                        //                 .text
                                                        //                 .toString()
                                                        //             : ''),
                                                        //   ),
                                                        //   series: <ChartSeries>[
                                                        //     // Grap series
                                                        //     LineSeries<ChartDatum, String>(
                                                        //         enableTooltip:
                                                        //             true,
                                                        //         isVisible: controller
                                                        //             .nspIsvisible1
                                                        //             .value,
                                                        //         dataSource: controller
                                                        //             .graphData!
                                                        //             .data[0]
                                                        //             .chartData,
                                                        //         xValueMapper: (ChartDatum gr, _) => gr.timeseries
                                                        //             .toString(),
                                                        //         yValueMapper: (ChartDatum gr, _) =>
                                                        //             gr.normalizedSaltPassage ??
                                                        //             0,
                                                        //         xAxisName: controller
                                                        //             .graphData!
                                                        //             .data[0]
                                                        //             .name
                                                        //             .toString(),
                                                        //         color: HexColor(controller
                                                        //                 .graphData!
                                                        //                 .data[0]
                                                        //                 .color
                                                        //                 .isNotEmpty
                                                        //             ? controller
                                                        //                 .graphData!
                                                        //                 .data[0]
                                                        //                 .color[0]
                                                        //             : '#a83232')),
                                                        //     LineSeries<
                                                        //         ChartDatum,
                                                        //         String>(
                                                        //       enableTooltip:
                                                        //           true,
                                                        //       isVisible: controller
                                                        //           .trendIsvisible1
                                                        //           .value,
                                                        //       dataSource:
                                                        //           controller
                                                        //               .graphData!
                                                        //               .data[0]
                                                        //               .chartData,
                                                        //       xValueMapper: (ChartDatum
                                                        //                   gr,
                                                        //               _) =>
                                                        //           gr.timeseries
                                                        //               .toString(),
                                                        //       yValueMapper:
                                                        //           (ChartDatum gr,
                                                        //                   _) =>
                                                        //               gr.linear ??
                                                        //               0,
                                                        //       color: HexColor(controller
                                                        //               .graphData!
                                                        //               .data[0]
                                                        //               .color
                                                        //               .isNotEmpty
                                                        //           ? controller
                                                        //               .graphData!
                                                        //               .data[0]
                                                        //               .color[1]
                                                        //           : '#a83232'),
                                                        //       markerSettings:
                                                        //           const MarkerSettings(
                                                        //         shape: DataMarkerType
                                                        //             .verticalLine,
                                                        //         isVisible: true,
                                                        //       ),
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Text(
                                                  "No data available for the selected range")),
                                      // GetBuilder(
                                      //   init: controller,
                                      //   builder: (_) => controller.graphData !=
                                      //           null
                                      //       ? SingleChildScrollView(
                                      //           scrollDirection:
                                      //               Axis.horizontal,
                                      //           physics:
                                      //               const BouncingScrollPhysics(),
                                      //           child: Row(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.start,
                                      //             children: [
                                      //               SizedBox(
                                      //                 width: 600,
                                      //                 height: 300,
                                      //                 child: SfCartesianChart(
                                      //                   trackballBehavior:
                                      //                       controller
                                      //                           .trackballBehavior,
                                      //                   enableAxisAnimation:
                                      //                       true,
                                      //                   zoomPanBehavior:
                                      //                       controller
                                      //                           .zoomPanBehavior,
                                      //                   title: ChartTitle(
                                      //                     text: controller
                                      //                         .graphData!
                                      //                         .data[1]
                                      //                         .name
                                      //                         .toString(),
                                      //                   ),
                                      //                   primaryYAxis:
                                      //                       NumericAxis(
                                      //                     title: AxisTitle(
                                      //                         alignment:
                                      //                             ChartAlignment
                                      //                                 .far,
                                      //                         textStyle:
                                      //                             const TextStyle(
                                      //                           fontWeight:
                                      //                               FontWeight
                                      //                                   .w600,
                                      //                           fontSize: 8,
                                      //                         ),
                                      //                         text: controller
                                      //                             .graphData!
                                      //                             .data[1]
                                      //                             .name
                                      //                             .toString()),
                                      //                   ),
                                      //                   primaryXAxis:
                                      //                       CategoryAxis(
                                      //                     title: AxisTitle(
                                      //                         alignment:
                                      //                             ChartAlignment
                                      //                                 .far,
                                      //                         textStyle:
                                      //                             const TextStyle(
                                      //                           fontWeight:
                                      //                               FontWeight
                                      //                                   .w600,
                                      //                           fontSize: 8,
                                      //                         ),
                                      //                         text: controller
                                      //                                 .graphData!
                                      //                                 .data[1]
                                      //                                 .reference
                                      //                                 .isNotEmpty
                                      //                             ? controller
                                      //                                 .graphData!
                                      //                                 .data[1]
                                      //                                 .reference[
                                      //                                     0]
                                      //                                 .text
                                      //                                 .toString()
                                      //                             : ''),
                                      //                   ),
                                      //                   series: <ChartSeries>[
                                      //                     // Grap series
                                      //                     LineSeries<ChartDatum,
                                      //                         String>(
                                      //                       isVisible: controller
                                      //                           .nspIsvisible2
                                      //                           .value,
                                      //                       dataSource:
                                      //                           controller
                                      //                               .graphData!
                                      //                               .data[1]
                                      //                               .chartData,
                                      //                       enableTooltip: true,
                                      //                       xValueMapper:
                                      //                           (ChartDatum gr,
                                      //                                   _) =>
                                      //                               gr.timeseries
                                      //                                   .toString(),
                                      //                       yValueMapper:
                                      //                           (ChartDatum gr,
                                      //                                   _) =>
                                      //                               gr.normalizedSaltPassage ??
                                      //                               0,
                                      //                       xAxisName:
                                      //                           controller
                                      //                               .graphData!
                                      //                               .data[1]
                                      //                               .name
                                      //                               .toString(),
                                      //                       color: HexColor(controller
                                      //                               .graphData!
                                      //                               .data[1]
                                      //                               .color
                                      //                               .isNotEmpty
                                      //                           ? controller
                                      //                               .graphData!
                                      //                               .data[1]
                                      //                               .color[0]
                                      //                           : '#a83232'),
                                      //                     ),
                                      //                     LineSeries<ChartDatum,
                                      //                         String>(
                                      //                       enableTooltip: true,
                                      //                       isVisible: controller
                                      //                           .trendIsvisible2
                                      //                           .value,
                                      //                       dataSource:
                                      //                           controller
                                      //                               .graphData!
                                      //                               .data[1]
                                      //                               .chartData,
                                      //                       xValueMapper:
                                      //                           (ChartDatum gr,
                                      //                                   _) =>
                                      //                               gr.timeseries
                                      //                                   .toString(),
                                      //                       yValueMapper:
                                      //                           (ChartDatum gr,
                                      //                                   _) =>
                                      //                               gr.linear ??
                                      //                               0,
                                      //                       color: HexColor(controller
                                      //                               .graphData!
                                      //                               .data[1]
                                      //                               .color
                                      //                               .isNotEmpty
                                      //                           ? controller
                                      //                               .graphData!
                                      //                               .data[1]
                                      //                               .color[1]
                                      //                           : '#a83232'),
                                      //                       markerSettings:
                                      //                           const MarkerSettings(
                                      //                         shape: DataMarkerType
                                      //                             .verticalLine,
                                      //                         isVisible: true,
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //               const SizedBox(width: 10),
                                      //               Column(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment
                                      //                         .start,
                                      //                 children: [
                                      //                   Row(
                                      //                     mainAxisAlignment:
                                      //                         MainAxisAlignment
                                      //                             .start,
                                      //                     children: [
                                      //                       SizedBox(
                                      //                         height: 20,
                                      //                         width: 20,
                                      //                         child: Card(
                                      //                           margin:
                                      //                               const EdgeInsets
                                      //                                   .all(5),
                                      //                           color: HexColor(controller
                                      //                                   .graphData!
                                      //                                   .data[1]
                                      //                                   .color
                                      //                                   .isNotEmpty
                                      //                               ? controller
                                      //                                   .graphData!
                                      //                                   .data[1]
                                      //                                   .color[0]
                                      //                               : '#a83232'),
                                      //                           elevation: 5,
                                      //                           shape:
                                      //                               RoundedRectangleBorder(
                                      //                             borderRadius:
                                      //                                 BorderRadius
                                      //                                     .circular(
                                      //                                         5),
                                      //                           ),
                                      //                           child:
                                      //                               Container(),
                                      //                         ),
                                      //                       ),
                                      //                       InkWell(
                                      //                         onTap: () => {
                                      //                           controller
                                      //                               .updateMarkerLine(
                                      //                                   'nsp1')
                                      //                         },
                                      //                         child: const Text(
                                      //                             "Normalised Permeate Flow"),
                                      //                       )
                                      //                     ],
                                      //                   ),
                                      //                   Row(
                                      //                     mainAxisAlignment:
                                      //                         MainAxisAlignment
                                      //                             .start,
                                      //                     children: [
                                      //                       SizedBox(
                                      //                         height: 20,
                                      //                         width: 20,
                                      //                         child: Card(
                                      //                           margin:
                                      //                               const EdgeInsets
                                      //                                   .all(5),
                                      //                           color: HexColor(controller
                                      //                                   .graphData!
                                      //                                   .data[1]
                                      //                                   .color
                                      //                                   .isNotEmpty
                                      //                               ? controller
                                      //                                   .graphData!
                                      //                                   .data[1]
                                      //                                   .color[1]
                                      //                               : '#a83232'),
                                      //                           elevation: 5,
                                      //                           shape:
                                      //                               RoundedRectangleBorder(
                                      //                             borderRadius:
                                      //                                 BorderRadius
                                      //                                     .circular(
                                      //                                         5),
                                      //                           ),
                                      //                           child:
                                      //                               Container(),
                                      //                         ),
                                      //                       ),
                                      //                       InkWell(
                                      //                         onTap: () => {
                                      //                           controller
                                      //                               .updateMarkerLine(
                                      //                                   'trend1')
                                      //                         },
                                      //                         child: const Text(
                                      //                             "Trend Line"),
                                      //                       )
                                      //                     ],
                                      //                   )
                                      //                 ],
                                      //               ),
                                      //               const SizedBox(width: 10),
                                      //               SizedBox(
                                      //                 height:
                                      //                     MediaQuery.of(context)
                                      //                             .size
                                      //                             .height *
                                      //                         0.21,
                                      //                 width: 250,
                                      //                 child: Card(
                                      //                   margin: const EdgeInsets
                                      //                       .all(16),
                                      //                   color: const Color
                                      //                       .fromARGB(
                                      //                       255, 231, 247, 255),
                                      //                   elevation: 5,
                                      //                   shape:
                                      //                       RoundedRectangleBorder(
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(5),
                                      //                     side:
                                      //                         const BorderSide(
                                      //                             width: 1,
                                      //                             color: Color
                                      //                                 .fromARGB(
                                      //                                     255,
                                      //                                     0,
                                      //                                     0,
                                      //                                     0)),
                                      //                   ),
                                      //                   child: Padding(
                                      //                     padding:
                                      //                         const EdgeInsets
                                      //                             .all(8.0),
                                      //                     child: Column(
                                      //                       mainAxisAlignment:
                                      //                           MainAxisAlignment
                                      //                               .start,
                                      //                       children: [
                                      //                         Row(
                                      //                           mainAxisAlignment:
                                      //                               MainAxisAlignment
                                      //                                   .start,
                                      //                           children: [
                                      //                             const Text(
                                      //                               "Mean",
                                      //                               style: TextStyle(
                                      //                                   fontSize:
                                      //                                       18,
                                      //                                   fontWeight:
                                      //                                       FontWeight.w500),
                                      //                             ),
                                      //                             const SizedBox(
                                      //                                 width: 5),
                                      //                             Text(
                                      //                               controller
                                      //                                   .graphData!
                                      //                                   .statisticalData[
                                      //                                       1]
                                      //                                   .mean
                                      //                                   .toString(),
                                      //                               style:
                                      //                                   TextStyle(
                                      //                                 color: Colors
                                      //                                         .grey[
                                      //                                     400],
                                      //                                 fontSize:
                                      //                                     18,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w500,
                                      //                               ),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                         const SizedBox(
                                      //                             height: 10),
                                      //                         Row(
                                      //                           mainAxisAlignment:
                                      //                               MainAxisAlignment
                                      //                                   .start,
                                      //                           children: [
                                      //                             const Text(
                                      //                               "Min",
                                      //                               style: TextStyle(
                                      //                                   fontSize:
                                      //                                       18,
                                      //                                   fontWeight:
                                      //                                       FontWeight.w500),
                                      //                             ),
                                      //                             const SizedBox(
                                      //                                 width: 5),
                                      //                             Text(
                                      //                               controller
                                      //                                   .graphData!
                                      //                                   .statisticalData[
                                      //                                       1]
                                      //                                   .min
                                      //                                   .toString(),
                                      //                               style:
                                      //                                   TextStyle(
                                      //                                 color: Colors
                                      //                                         .grey[
                                      //                                     400],
                                      //                                 fontSize:
                                      //                                     18,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w500,
                                      //                               ),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                         const SizedBox(
                                      //                             height: 10),
                                      //                         Row(
                                      //                           mainAxisAlignment:
                                      //                               MainAxisAlignment
                                      //                                   .start,
                                      //                           children: [
                                      //                             const Text(
                                      //                               "MAX",
                                      //                               style: TextStyle(
                                      //                                   fontSize:
                                      //                                       18,
                                      //                                   fontWeight:
                                      //                                       FontWeight.w500),
                                      //                             ),
                                      //                             const SizedBox(
                                      //                                 width: 5),
                                      //                             Text(
                                      //                               controller
                                      //                                   .graphData!
                                      //                                   .statisticalData[
                                      //                                       1]
                                      //                                   .max
                                      //                                   .toString(),
                                      //                               style:
                                      //                                   TextStyle(
                                      //                                 color: Colors
                                      //                                         .grey[
                                      //                                     400],
                                      //                                 fontSize:
                                      //                                     18,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w500,
                                      //                               ),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                         const SizedBox(
                                      //                             height: 10),
                                      //                         Row(
                                      //                           mainAxisAlignment:
                                      //                               MainAxisAlignment
                                      //                                   .start,
                                      //                           children: [
                                      //                             const Text(
                                      //                               "STD",
                                      //                               style: TextStyle(
                                      //                                   fontSize:
                                      //                                       18,
                                      //                                   fontWeight:
                                      //                                       FontWeight.w500),
                                      //                             ),
                                      //                             const SizedBox(
                                      //                                 width: 5),
                                      //                             Text(
                                      //                               controller
                                      //                                   .graphData!
                                      //                                   .statisticalData[
                                      //                                       1]
                                      //                                   .std
                                      //                                   .toString(),
                                      //                               style:
                                      //                                   TextStyle(
                                      //                                 color: Colors
                                      //                                         .grey[
                                      //                                     400],
                                      //                                 fontSize:
                                      //                                     18,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w500,
                                      //                               ),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                       ],
                                      //                     ),
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         )
                                      //       : Container(),
                                      // ),
                                      // const SizedBox(height: 10),
                                      // GetBuilder(
                                      //   init: controller,
                                      //   builder: (_) => controller.graphData !=
                                      //           null
                                      //       ? SingleChildScrollView(
                                      //           scrollDirection:
                                      //               Axis.horizontal,
                                      //           physics:
                                      //               const BouncingScrollPhysics(),
                                      //           child: Row(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.start,
                                      //             children: [
                                      //               SizedBox(
                                      //                 width: 600,
                                      //                 height: 300,
                                      //                 child: SfCartesianChart(
                                      //                   trackballBehavior:
                                      //                       controller
                                      //                           .trackballBehavior,
                                      //                   enableAxisAnimation:
                                      //                       true,
                                      //                   zoomPanBehavior:
                                      //                       controller
                                      //                           .zoomPanBehavior,
                                      //                   title: ChartTitle(
                                      //                     text: controller
                                      //                         .graphData!
                                      //                         .data[2]
                                      //                         .name
                                      //                         .toString(),
                                      //                   ),
                                      //                   primaryYAxis:
                                      //                       NumericAxis(
                                      //                     title: AxisTitle(
                                      //                         alignment:
                                      //                             ChartAlignment
                                      //                                 .far,
                                      //                         textStyle:
                                      //                             const TextStyle(
                                      //                           fontWeight:
                                      //                               FontWeight
                                      //                                   .w600,
                                      //                           fontSize: 8,
                                      //                         ),
                                      //                         text: controller
                                      //                             .graphData!
                                      //                             .data[2]
                                      //                             .name
                                      //                             .toString()),
                                      //                   ),
                                      //                   primaryXAxis:
                                      //                       CategoryAxis(
                                      //                     title: AxisTitle(
                                      //                         alignment:
                                      //                             ChartAlignment
                                      //                                 .far,
                                      //                         textStyle:
                                      //                             const TextStyle(
                                      //                           fontWeight:
                                      //                               FontWeight
                                      //                                   .w600,
                                      //                           fontSize: 8,
                                      //                         ),
                                      //                         text: controller
                                      //                                 .graphData!
                                      //                                 .data[2]
                                      //                                 .reference
                                      //                                 .isNotEmpty
                                      //                             ? controller
                                      //                                 .graphData!
                                      //                                 .data[2]
                                      //                                 .reference[
                                      //                                     0]
                                      //                                 .text
                                      //                                 .toString()
                                      //                             : ''),
                                      //                   ),
                                      //                   series: <ChartSeries>[
                                      //                     // Grap series
                                      //                     LineSeries<ChartDatum,
                                      //                         String>(
                                      //                       isVisible: controller
                                      //                           .nspIsvisible3
                                      //                           .value,
                                      //                       dataSource:
                                      //                           controller
                                      //                               .graphData!
                                      //                               .data[2]
                                      //                               .chartData,
                                      //                       enableTooltip: true,
                                      //                       xValueMapper:
                                      //                           (ChartDatum gr,
                                      //                                   _) =>
                                      //                               gr.timeseries
                                      //                                   .toString(),
                                      //                       yValueMapper:
                                      //                           (ChartDatum gr,
                                      //                                   _) =>
                                      //                               gr.normalizedDp ??
                                      //                               0,
                                      //                       xAxisName:
                                      //                           controller
                                      //                               .graphData!
                                      //                               .data[2]
                                      //                               .name
                                      //                               .toString(),
                                      //                       color: HexColor(controller
                                      //                               .graphData!
                                      //                               .data[2]
                                      //                               .color
                                      //                               .isNotEmpty
                                      //                           ? controller
                                      //                               .graphData!
                                      //                               .data[2]
                                      //                               .color[0]
                                      //                           : '#a83232'),
                                      //                     ),
                                      //                     LineSeries<ChartDatum,
                                      //                         String>(
                                      //                       isVisible: controller
                                      //                           .trendIsvisible3
                                      //                           .value,
                                      //                       dataSource:
                                      //                           controller
                                      //                               .graphData!
                                      //                               .data[2]
                                      //                               .chartData,
                                      //                       xValueMapper:
                                      //                           (ChartDatum gr,
                                      //                                   _) =>
                                      //                               gr.timeseries
                                      //                                   .toString(),
                                      //                       yValueMapper:
                                      //                           (ChartDatum gr,
                                      //                                   _) =>
                                      //                               gr.linear ??
                                      //                               0,
                                      //                       color: HexColor(controller
                                      //                               .graphData!
                                      //                               .data[2]
                                      //                               .color
                                      //                               .isNotEmpty
                                      //                           ? controller
                                      //                               .graphData!
                                      //                               .data[2]
                                      //                               .color[1]
                                      //                           : '#a83232'),
                                      //                       markerSettings:
                                      //                           const MarkerSettings(
                                      //                         shape: DataMarkerType
                                      //                             .verticalLine,
                                      //                         isVisible: true,
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //               const SizedBox(width: 10),
                                      //               Column(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment
                                      //                         .start,
                                      //                 children: [
                                      //                   Row(
                                      //                     mainAxisAlignment:
                                      //                         MainAxisAlignment
                                      //                             .start,
                                      //                     children: [
                                      //                       SizedBox(
                                      //                         height: 20,
                                      //                         width: 20,
                                      //                         child: Card(
                                      //                           margin:
                                      //                               const EdgeInsets
                                      //                                   .all(5),
                                      //                           color: HexColor(controller
                                      //                                   .graphData!
                                      //                                   .data[2]
                                      //                                   .color
                                      //                                   .isNotEmpty
                                      //                               ? controller
                                      //                                   .graphData!
                                      //                                   .data[2]
                                      //                                   .color[0]
                                      //                               : '#a83232'),
                                      //                           elevation: 5,
                                      //                           shape:
                                      //                               RoundedRectangleBorder(
                                      //                             borderRadius:
                                      //                                 BorderRadius
                                      //                                     .circular(
                                      //                                         5),
                                      //                           ),
                                      //                           child:
                                      //                               Container(),
                                      //                         ),
                                      //                       ),
                                      //                       InkWell(
                                      //                         onTap: () => {
                                      //                           controller
                                      //                               .updateMarkerLine(
                                      //                                   'nsp2')
                                      //                         },
                                      //                         child: const Text(
                                      //                             "Normalised Salt Passage"),
                                      //                       )
                                      //                     ],
                                      //                   ),
                                      //                   Row(
                                      //                     mainAxisAlignment:
                                      //                         MainAxisAlignment
                                      //                             .start,
                                      //                     children: [
                                      //                       SizedBox(
                                      //                         height: 20,
                                      //                         width: 20,
                                      //                         child: Card(
                                      //                           margin:
                                      //                               const EdgeInsets
                                      //                                   .all(5),
                                      //                           color: HexColor(controller
                                      //                                   .graphData!
                                      //                                   .data[2]
                                      //                                   .color
                                      //                                   .isNotEmpty
                                      //                               ? controller
                                      //                                   .graphData!
                                      //                                   .data[2]
                                      //                                   .color[1]
                                      //                               : '#a83232'),
                                      //                           elevation: 5,
                                      //                           shape:
                                      //                               RoundedRectangleBorder(
                                      //                             borderRadius:
                                      //                                 BorderRadius
                                      //                                     .circular(
                                      //                                         5),
                                      //                           ),
                                      //                           child:
                                      //                               Container(),
                                      //                         ),
                                      //                       ),
                                      //                       InkWell(
                                      //                         onTap: () => {
                                      //                           controller
                                      //                               .updateMarkerLine(
                                      //                                   'trend2')
                                      //                         },
                                      //                         child: const Text(
                                      //                             "Trend Line"),
                                      //                       )
                                      //                     ],
                                      //                   )
                                      //                 ],
                                      //               ),
                                      //               const SizedBox(width: 10),
                                      //               SizedBox(
                                      //                 height:
                                      //                     MediaQuery.of(context)
                                      //                             .size
                                      //                             .height *
                                      //                         0.21,
                                      //                 width: 250,
                                      //                 child: Card(
                                      //                   margin: const EdgeInsets
                                      //                       .all(16),
                                      //                   color: const Color
                                      //                       .fromARGB(
                                      //                       255, 231, 247, 255),
                                      //                   elevation: 5,
                                      //                   shape:
                                      //                       RoundedRectangleBorder(
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(5),
                                      //                     side:
                                      //                         const BorderSide(
                                      //                             width: 1,
                                      //                             color: Color
                                      //                                 .fromARGB(
                                      //                                     255,
                                      //                                     0,
                                      //                                     0,
                                      //                                     0)),
                                      //                   ),
                                      //                   child: Padding(
                                      //                     padding:
                                      //                         const EdgeInsets
                                      //                             .all(8.0),
                                      //                     child: Column(
                                      //                       mainAxisAlignment:
                                      //                           MainAxisAlignment
                                      //                               .start,
                                      //                       children: [
                                      //                         Row(
                                      //                           mainAxisAlignment:
                                      //                               MainAxisAlignment
                                      //                                   .start,
                                      //                           children: [
                                      //                             const Text(
                                      //                               "Mean",
                                      //                               style: TextStyle(
                                      //                                   fontSize:
                                      //                                       18,
                                      //                                   fontWeight:
                                      //                                       FontWeight.w500),
                                      //                             ),
                                      //                             const SizedBox(
                                      //                                 width: 5),
                                      //                             Text(
                                      //                               controller
                                      //                                   .graphData!
                                      //                                   .statisticalData[
                                      //                                       1]
                                      //                                   .mean
                                      //                                   .toString(),
                                      //                               style:
                                      //                                   TextStyle(
                                      //                                 color: Colors
                                      //                                         .grey[
                                      //                                     400],
                                      //                                 fontSize:
                                      //                                     18,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w500,
                                      //                               ),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                         const SizedBox(
                                      //                             height: 10),
                                      //                         Row(
                                      //                           mainAxisAlignment:
                                      //                               MainAxisAlignment
                                      //                                   .start,
                                      //                           children: [
                                      //                             const Text(
                                      //                               "Min",
                                      //                               style: TextStyle(
                                      //                                   fontSize:
                                      //                                       18,
                                      //                                   fontWeight:
                                      //                                       FontWeight.w500),
                                      //                             ),
                                      //                             const SizedBox(
                                      //                                 width: 5),
                                      //                             Text(
                                      //                               controller
                                      //                                   .graphData!
                                      //                                   .statisticalData[
                                      //                                       1]
                                      //                                   .min
                                      //                                   .toString(),
                                      //                               style:
                                      //                                   TextStyle(
                                      //                                 color: Colors
                                      //                                         .grey[
                                      //                                     400],
                                      //                                 fontSize:
                                      //                                     18,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w500,
                                      //                               ),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                         const SizedBox(
                                      //                             height: 10),
                                      //                         Row(
                                      //                           mainAxisAlignment:
                                      //                               MainAxisAlignment
                                      //                                   .start,
                                      //                           children: [
                                      //                             const Text(
                                      //                               "MAX",
                                      //                               style: TextStyle(
                                      //                                   fontSize:
                                      //                                       18,
                                      //                                   fontWeight:
                                      //                                       FontWeight.w500),
                                      //                             ),
                                      //                             const SizedBox(
                                      //                                 width: 5),
                                      //                             Text(
                                      //                               controller
                                      //                                   .graphData!
                                      //                                   .statisticalData[
                                      //                                       1]
                                      //                                   .max
                                      //                                   .toString(),
                                      //                               style:
                                      //                                   TextStyle(
                                      //                                 color: Colors
                                      //                                         .grey[
                                      //                                     400],
                                      //                                 fontSize:
                                      //                                     18,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w500,
                                      //                               ),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                         const SizedBox(
                                      //                             height: 10),
                                      //                         Row(
                                      //                           mainAxisAlignment:
                                      //                               MainAxisAlignment
                                      //                                   .start,
                                      //                           children: [
                                      //                             const Text(
                                      //                               "STD",
                                      //                               style: TextStyle(
                                      //                                   fontSize:
                                      //                                       18,
                                      //                                   fontWeight:
                                      //                                       FontWeight.w500),
                                      //                             ),
                                      //                             const SizedBox(
                                      //                                 width: 5),
                                      //                             Text(
                                      //                               controller
                                      //                                   .graphData!
                                      //                                   .statisticalData[
                                      //                                       1]
                                      //                                   .std
                                      //                                   .toString(),
                                      //                               style:
                                      //                                   TextStyle(
                                      //                                 color: Colors
                                      //                                         .grey[
                                      //                                     400],
                                      //                                 fontSize:
                                      //                                     18,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w500,
                                      //                               ),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                       ],
                                      //                     ),
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         )
                                      //       : Container(),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 200,
                      //   width: double.infinity,
                      //   child: Card(
                      //     margin: const EdgeInsets.all(16.0),
                      //     color: Colors.white,
                      //     elevation: 5,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //       side: const BorderSide(
                      //           width: 1,
                      //           color: Color.fromARGB(255, 137, 226, 253)),
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(
                      //           top: 8, left: 14, right: 14, bottom: 14),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           SizedBox(
                      //             height: 120,
                      //             width: 400,
                      //             child: Card(
                      //               margin: const EdgeInsets.all(16.0),
                      //               color: Colors.white,
                      //               elevation: 5,
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(20),
                      //                 side: const BorderSide(
                      //                     width: 1,
                      //                     color: Color.fromARGB(
                      //                         255, 239, 239, 239)),
                      //               ),
                      //               child: const Padding(
                      //                 padding: EdgeInsets.only(
                      //                     top: 8,
                      //                     left: 14,
                      //                     right: 14,
                      //                     bottom: 14),
                      //                 child: Center(
                      //                     child: Text(
                      //                   "Benchmark Data",
                      //                   style: TextStyle(
                      //                       color: Color.fromARGB(
                      //                           255, 238, 153, 153),
                      //                       fontSize: 16,
                      //                       fontWeight: FontWeight.w800),
                      //                 )),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
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

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
