import 'package:dio/dio.dart';
import '../model/user.dart';

abstract class IUserService {
  final Dio dio;
  IUserService(this.dio);
  Future<User?> registerUser(String name, String email, String password);
  Future<User?> loginUser(String email, String password);
  Future<User?> verifyToken();
  Future<void> logout();
  Future<User?> addWish(String userId, String productId);
}
