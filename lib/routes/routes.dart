import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/login.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login';

  static List<GetPage> routes = [GetPage(name: login, page: () => Login())];
}
