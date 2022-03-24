import '../../../core/cache/local_manager.dart';
import 'Iuser_service.dart';
import 'package:dio/dio.dart';
import '../model/user.dart';

class UserService extends IUserService {
  UserService(Dio dio) : super(dio);
  final LocalManager _localManager = LocalManager.instance;
  final String _baseUrl = "http://10.0.2.2:3000";

  @override
  Future<User?> registerUser(String name, String email, String password) async {
    final response = await dio.post('$_baseUrl/users/register',
        data: {'name': name, 'email': email, 'password': password});
    if (response.statusCode == 201) {
      final user = User.fromJson(response.data);
      return user;
    } else {
      return null;
    }
  }

  @override
  Future<User?> loginUser(String email, String password) async {
    final response = await dio.post('$_baseUrl/users/login',
        data: {'email': email, 'password': password});
    if (response.statusCode == 202) {
      final user = User.fromJson(response.data);
      _localManager.saveToken('token', response.data['token']);
      return user;
    } else {
      return null;
    }
  }

  @override
  Future<User?> verifyToken() async {
    String? token = await _localManager.getToken('token');
    final response =
        await dio.post('$_baseUrl/users/verify', data: {'token': token});
    if (response.statusCode == 202) {
      final user = User.fromJson(response.data);
      return user;
    }
    return null;
  }

  @override
  Future<User?> addWish(String userId, String productId) async {
    final response = await dio.post('$_baseUrl/products/wishList/add-product',
        data: {'userId': userId, 'productId': productId});
    if (response.statusCode == 200) {
      final user = User.fromJson(response.data);
      return user;
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _localManager.deleteToken('token');
  }
}
