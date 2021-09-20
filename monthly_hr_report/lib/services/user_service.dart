import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:monthly_hr_report/commons/constants.dart';
import 'package:monthly_hr_report/models/server_response.dart';

import '../models/user.dart';

class UserService {
  static const String PATH = "/users";

  Future<String> createUser(User user) async {
    Uri url = Uri.parse(Constants.SERVER + PATH);

    var userJson = user.toJson();
    userJson['password'] = sha512.convert(utf8.encode(userJson['password'])).toString();
    var body = json.encode(userJson);

    try {
      http.Response response = await http.post(url, body: body, headers: Constants.HEADER);
      logger.d(response.statusCode);
      if (response.statusCode == 201) {
        return 'success';
      }
    } catch (error) {
      print('error: $error');
      return 'failed';
    }
    return null;
  }

  Future<ServerResponse> getUsers() async {
    Uri url = Uri.parse(Constants.SERVER + PATH);
    try {
      http.Response response = await http.get(url, headers: Constants.HEADER);
      if (response.statusCode == 200) {
        print(response);
        var users = User.formJson(json.decode(response.body));
        print(users);
       return ServerResponse(data: [], status: 'Successful', message: 'all good');
      }
    } catch(error) {
      return ServerResponse(message: 'Failed to get users');
    }
    return ServerResponse(message: 'Error');

  }
//
//  Future<ServerResponse> login(String username, String password) async {
//    String url = Constants.SERVER + PATH + '/login';
//
//    User user = User();
//    user.username = username;
//    user.password = sha512.convert(utf8.encode(password)).toString();
//
//    var userJson = user.toJson();
//    var body = json.encode(userJson);
//
//    try {
//      http.Response response = await http.post(url, body: body, headers: Constants.HEADER);
//      var responseJson = json.decode(response.body);
//      ServerResponse serverResponse = ServerResponse.fromJson(responseJson);
//      serverResponse.data = User.formJson(serverResponse.data);
//      return serverResponse;
//    } catch (error) {
//      return ServerResponse(status: FAILED, message: error, data: null);
//    }
//  }
}
