import 'package:dio/dio.dart';
import '../model/product.dart';
import '../model/type.dart';

abstract class IProductService {
  final Dio dio;

  IProductService(this.dio);

  Future<List<ProductType>?> getTypes();
  Future<List<Product>?> getProduct();
  Future<List<Product>?> getTrends(String typeId);
  Future<List<Product>?> getUpdated(String typeId);
  Future<List<Product>?> getWishList(String userId);
}
