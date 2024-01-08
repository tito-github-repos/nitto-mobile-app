import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitto_app/controllers/home_controller.dart';
import 'package:nitto_app/utils/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  elevation: 3, // Set the elevation as needed
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    width: 100,
                                    height: 30,
                                    child: DropdownButtonFormField(
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
                                              color: Colors.red, width: 1.5),
                                        ),
                                      ),
                                      value: controller.dropdownValue,
                                      onChanged: (String? value) {
                                        controller.dropdownValue = value;
                                      },
                                      items: controller.plan
                                          .map((cityTitle) => DropdownMenuItem(
                                                value: cityTitle,
                                                child: Text(
                                                  cityTitle,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 3, // Set the elevation as needed
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    width: 120, // Increase the width as needed
                                    height: 30,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 12.0),
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
                                              color: Colors.red, width: 1.5),
                                        ),
                                      ),
                                      value: controller.dropdownValue1,
                                      onChanged: (String? value) {
                                        // Handle dropdown value change
                                        controller.dropdownValue1 = value;
                                      },
                                      items: controller.train
                                          .map((cityTitle) => DropdownMenuItem(
                                                value: cityTitle,
                                                child: Tooltip(
                                                  message: cityTitle,
                                                  child: Text(
                                                    cityTitle,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
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
                                      onPressed: null,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: Text(
                                        "Download Summary",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
                      SizedBox(
                        height: 300,
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
                                top: 8, left: 14, right: 14, bottom: 14),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: controller.id,
                                          onChanged: (val) {
                                            controller.radioButtonItem = 'ONE';
                                            controller.id = 1;
                                          },
                                        ),
                                        const Text(
                                          'Past 24 Hrs',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Radio(
                                          value: 2,
                                          groupValue: controller.id,
                                          onChanged: (val) {
                                            controller.radioButtonItem = 'TWO';
                                            controller.id = 2;
                                          },
                                        ),
                                        const Text(
                                          'Past 1 Week',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Radio(
                                          value: 3,
                                          groupValue: controller.id,
                                          onChanged: (val) {
                                            controller.radioButtonItem =
                                                'THREE';
                                            controller.id = 3;
                                          },
                                        ),
                                        const Text(
                                          'Past 1 Month',
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                        Radio(
                                          value: 4,
                                          groupValue: controller.id,
                                          onChanged: (val) {
                                            controller.radioButtonItem = 'FOUR';
                                            controller.id = 4;
                                          },
                                        ),
                                        const Text(
                                          'Past 1 Month',
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SfCartesianChart(
                                    primaryXAxis: CategoryAxis(
                                      interval: 1,
                                    ),
                                    // Enable tooltip
                                    tooltipBehavior: controller.tooltipBehavior,
                                    series: <LineSeries<SalesData, String>>[
                                      LineSeries<SalesData, String>(
                                        dataSource: <SalesData>[
                                          SalesData('01-May-20233', 35),
                                          SalesData('01-Jun-20233', 28),
                                          SalesData('01-Jul-20233', 34),
                                          SalesData('01-Aug-20233', 32),
                                          SalesData('01-Sep-20233', 40),
                                          SalesData('01-Oct-20233', 40),
                                          SalesData('01-Nov-20233', 40),
                                        ],
                                        xValueMapper: (SalesData sales, _) =>
                                            sales.year,
                                        yValueMapper: (SalesData sales, _) =>
                                            sales.sales,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
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
                                top: 8, left: 14, right: 14, bottom: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: 400,
                                  child: Card(
                                    margin: const EdgeInsets.all(16.0),
                                    color: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: const BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239)),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          top: 8,
                                          left: 14,
                                          right: 14,
                                          bottom: 14),
                                      child: Center(
                                          child: Text(
                                        "Benchmark Data",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 238, 153, 153),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                      )),
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
