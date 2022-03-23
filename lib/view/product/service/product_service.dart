import 'dart:io';
import '../../../core/enum/network_enum.dart';
import '../model/product.dart';
import '../model/type.dart';
import 'IProduct_service.dart';
import 'package:dio/src/dio.dart';

class ProductService extends IProductService {
  ProductService(Dio dio) : super(dio);

  final String _baseUrl = "http://10.0.2.2:3000";

  @override
  Future<List<ProductType>?> getTypes() async {
    final response = await dio.get('$_baseUrl/types');

    if (response.statusCode == HttpStatus.ok) {
      final data = List<Map<String, dynamic>>.from(response.data);
      List<ProductType> types =
          data.map((e) => ProductType.fromJson(e)).toList();
      return types;
    }
    return null;
  }

  @override
  Future<List<Product>?> getProduct() async {
    final response = await dio.get('$_baseUrl${NetworkPath.MAIN.rawValue}',
        queryParameters: Map.fromEntries([]));
    if (response.statusCode == HttpStatus.ok) {
      print(response.data);
      final data = List<Map<String, dynamic>>.from(response.data);
      List<Product> products = data.map((e) => Product.fromJson(e)).toList();
      return products;
    }
    return null;
  }

  @override
  Future<List<Product>?> getTrends(String typeId) async {
    final response = await dio.get('$_baseUrl${NetworkPath.TREND.rawValue}',
        queryParameters:
            Map.fromEntries([NetworkQueryParameters.TYPE.rawValue(typeId)]));
    if (response.statusCode == HttpStatus.ok) {
      final data = List<Map<String, dynamic>>.from(response.data);
      List<Product> products = data.map((e) => Product.fromJson(e)).toList();
      return products;
    }
    return null;
  }

  @override
  Future<List<Product>?> getUpdated(String typeId) async {
    final response = await dio.get('$_baseUrl${NetworkPath.UPDATED.rawValue}',
        queryParameters:
            Map.fromEntries([NetworkQueryParameters.TYPE.rawValue(typeId)]));
    if (response.statusCode == HttpStatus.ok) {
      final data = List<Map<String, dynamic>>.from(response.data);
      List<Product> products = data.map((e) => Product.fromJson(e)).toList();
      return products;
    }
    return null;
  }
}