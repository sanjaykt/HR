import 'package:flutter/cupertino.dart';
import 'package:monthly_hr_report/models/server_response.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserProvider extends ChangeNotifier {
  UserService _userService = UserService();

  Future<String> createUser(User user) {
    return _userService.createUser(user);
  }

  Future<ServerResponse> getUsers() {
    return _userService.getUsers();
  }

//  Future<ServerResponse> login(String username, String password) {
//    return _userService.login(username, password);
//  }
}
