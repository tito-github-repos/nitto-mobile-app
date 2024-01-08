import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../utils/app_strings.dart';

class RemoteService {
  var loginDetails = GetStorage().read("gs_login_data") != ''
      ? GetStorage().read("gs_login_data")
      : '';
  var baseUrl = AppStrings.baseUrl;

  checkUser(data) async {
    try {
      print(data);
      var postData = {"username": data, "api_key": "API_KEY"};
      final uri = Uri.parse('$baseUrl/user/check');
      print("url --------> $uri");
      print("post data --------> $postData");
      var response = await http.post(uri, body: postData);
      return response;
    } catch (err) {
      return null;
    }
  }

  login(data) async {
    try {
      final uri = Uri.parse('$baseUrl/user/checkPW');
      print("URL ======> $uri");
      print("POST data ======> $data");
      var response = await http.post(uri, body: data);
      return response;
    } catch (err) {
      return null;
    }
  }

  register(data) async {
    try {
      print(data);
      final uri = Uri.parse('$baseUrl/user/register');
      print("url data -------> $uri");
      var response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: data);
      return response;
    } catch (err) {
      print(err);
      return null;
    }
  }

  getCheckListForm(id) async {
    try {
      //var quaryParams = {"id": id, "token": loginDetails["token"]};
      final uri = Uri.parse('$baseUrl/campuses/$id');
      print("-------> url $uri");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getAllHistory() async {
    try {
      final uri = Uri.parse('$baseUrl/feedbacks');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  viewHistory(id) async {
    try {
      final uri = Uri.parse('$baseUrl/feedbacks/$id/$loginDetails["token"]');
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getMyTeamService() async {
    try {
      final uri = Uri.parse('$baseUrl/assignments');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getMyChecklistService() async {
    try {
      final uri = Uri.parse('$baseUrl/checklists');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getMyHistoryService() async {
    try {
      final uri = Uri.parse('$baseUrl/myfeedbacks');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getDashboardService() async {
    try {
      final uri = Uri.parse('$baseUrl/apps/dashboard');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getOverRideService() async {
    try {
      final uri = Uri.parse('$baseUrl/override');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getPlantService() async {
    try {
      print("check data ------> ${loginDetails["emailID"]}");
      var postData = {
        //"username": loginDetails["emailID"],
        "emailID": "demouser34@tito.org.in",
      };
      final uri = Uri.parse('$baseUrl/mobile/plant/getPlants');
      var response = await http.post(uri,
          // headers: {
          //   'Content-Type': 'application/json',
          //   'Accept': 'application/json',
          // },
          body: postData);
      return response;
    } catch (err) {
      return null;
    }
  }

  getTrainService(data) async {
    try {
      var postData = {
        "plantUnqiueId": data,
      };
      final uri = Uri.parse('$baseUrl/mobile/plant/getTrains');
      var response = await http.post(uri, body: postData);
      return response;
    } catch (err) {
      return null;
    }
  }

  getPassService(data) async {
    try {
      var postData = {
        "trainUniqueId": data,
      };
      final uri = Uri.parse('$baseUrl/mobile/plant/getPasses');
      var response = await http.post(uri, body: postData);
      return response;
    } catch (err) {
      return null;
    }
  }

  getStageService(data) async {
    try {
      var postData = {
        "passUniqueId": data,
      };
      final uri = Uri.parse('$baseUrl/mobile/plant/getStages');
      var response = await http.post(uri, body: postData);
      return response;
    } catch (err) {
      return null;
    }
  }

  getGraphService(stageId) async {
    try {
      var postData = {
        "stageId": "STAGE-1-Z1I703K",
        "from": "2023-06-17",
        "to": "2023-12-17"
      };
      print("---------> $postData");
      final uri = Uri.parse('$baseUrl/plant/tsDataMobile');
      var response = await http.post(uri, body: postData);
      return response;
    } catch (err) {
      return null;
    }
  }

  addSetPointService(payload) async {
    try {
      print("---------> $payload");
      final uri = Uri.parse('$baseUrl/plant/addSetPoints');
      var response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: payload);
      return response;
    } catch (err) {
      print("------service-----> $err");
      return null;
    }
  }

  Future getSetPoints(payload) async {
    try {
      final uri = Uri.parse('$baseUrl/plant/setPoint');
      var response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: payload);
      return response;
    } catch (err) {
      print("------service-----> $err");
      return null;
    }
  }

  Future getUserManagementList(payload) async {
    try {
      final uri = Uri.parse('$baseUrl/plant/userList');
      var response = await http.post(uri, body: payload);
      return response;
    } catch (err) {
      print("------service-----> $err");
      return null;
    }
  }

  Future userExistService(payload) async {
    try {
      final uri = Uri.parse('$baseUrl/user/isExist');
      var response = await http.post(uri, body: payload);
      return response;
    } catch (err) {
      print("------service-----> $err");
      return null;
    }
  }

  Future assignUser(payload) async {
    try {
      final uri = Uri.parse('$baseUrl/plant/userManagement');
      var response = await http.post(uri, body: payload);
      return response;
    } catch (err) {
      print("------service-----> $err");
      return null;
    }
  }

  Future gaugeData(payload) async {
    try {
      final uri = Uri.parse('$baseUrl/plant/gaugeData');
      var response = await http.post(uri, body: payload);
      return response;
    } catch (err) {
      print("------service-----> $err");
      return null;
    }
  }
}
