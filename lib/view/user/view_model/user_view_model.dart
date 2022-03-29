import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../core/base/model/base_view_model.dart';
import '../model/user.dart';
import '../service/Iuser_service.dart';
import '../service/user_service.dart';

class UserViewModel extends ChangeNotifier with BaseViewModel {
  final IUserService userService = UserService(Dio());

  User? user;
  bool isLoading = true;
  bool isLogin = true;
  bool isVerified = false;
  late BuildContext context;
  bool isFavorite = false;

  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  void isLoadingChange() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void isLoginChange(bool value) {
    isLogin = value;
    notifyListeners();
  }

  Future<bool> registerUser(String name, String email, String password) async {
    final response = await userService.registerUser(name, email, password);
    if (response != null) {
      user = response;
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<bool> loginUser(String email, String password) async {
    final response = await userService.loginUser(email, password);
    if (response != null) {
      User _user = User();
      _user = response;
      user = _user;
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<void> verifyToken() async {
    final startTime = DateTime.now().millisecondsSinceEpoch;
    final response = await userService.verifyToken();
    if (response != null) {
      user = response;
      isVerified = true;
    } else {
      isVerified = false;
    }
    final endTime = DateTime.now().millisecondsSinceEpoch;
    if (endTime - startTime < 4000) {
      await Future.delayed(
          Duration(milliseconds: (4000 - (endTime - startTime))));
    }
    isLoadingChange();
    notifyListeners();
  }

  void isFavoriteControl(String productId) {
    if (user == null || user?.wishList == null) {
      isFavorite = false;
    } else {
      if (user!.wishList!.isEmpty) {
        isFavorite = false;
      } else {
        isFavorite = user!.wishList!.any((element) => element == productId);
      }
    }
  }

  Future<void> addWishListProduct(String productId) async {
    final response = await userService.addWish(user?.id ?? '', productId);
    if (response != null) user = response;
    notifyListeners();
  }

  Future<void> logout() async {
    await userService.logout();
  }
}
