import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nitto_app/screens/home.dart';
import 'package:nitto_app/screens/plant_details.dart';
import 'package:nitto_app/screens/register.dart';
import 'package:nitto_app/screens/set_points.dart';
import 'package:nitto_app/screens/under_process.dart';
import 'package:nitto_app/screens/user_information.dart';
import 'package:nitto_app/screens/user_management.dart';

import '../screens/login.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String plantDetails = '/plant_details';
  static const String setPoints = '/set_points';
  static const String userManagement = '/user_management';
  static const String userInformation = '/user_information';
  static const String underProcess = '/underProcess';

  static List<GetPage> routes = [
    GetPage(name: login, page: () => Login()),
    GetPage(name: register, page: () => Register()),
    GetPage(name: home, page: () => Home()),
    GetPage(name: plantDetails, page: () => PlantDetails()),
    GetPage(name: setPoints, page: () => SetPoints()),
    GetPage(name: userManagement, page: () => UserManagement()),
    GetPage(name: userInformation, page: () => UserInformation()),
    GetPage(name: underProcess, page: () => UnderProcess())
  ];
}
