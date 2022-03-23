import 'package:app_store/core/base/model/base_view_model.dart';
import 'package:app_store/view/user/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class UserViewModel extends ChangeNotifier with BaseViewModel {
  late UserService _userService;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  User? user;

  bool isLogin = true;
  late BuildContext context;

  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    _userService = UserService(Dio());
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void isLoginChange(bool value) {
    isLogin = value;
    notifyListeners();
  }

  Future<bool> registerUser() async {
    final response = await _userService.registerUser(
        nameController!.text, emailController!.text, passwordController!.text);
    if (response != null) {
      user = response;
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<bool> loginUser() async {
    final response = await _userService.loginUser(
        emailController!.text, passwordController!.text);
    if (response != null) {
      user = response;
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
}
