import 'package:flutter/material.dart';
import '../../../core/base/model/base_view_model.dart';
import '../service/user_service.dart';
import '../model/user.dart';

class UserViewModel extends ChangeNotifier with BaseViewModel {
  final UserService userService;
  UserViewModel({required this.userService});

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  User? user;
  bool isLoading = true;
  bool isLogin = true;
  bool isVerified = false;
  late BuildContext context;
  bool isFavorite = false;

  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void isLoadingChange() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void isLoginChange(bool value) {
    isLogin = value;
    notifyListeners();
  }

  Future<bool> registerUser() async {
    final response = await userService.registerUser(
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
    final response = await userService.loginUser(
        emailController!.text, passwordController!.text);
    if (response != null) {
      user = response;
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
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
    if (endTime - startTime < 2500) {
      await Future.delayed(Duration(milliseconds: ((endTime - startTime))));
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
