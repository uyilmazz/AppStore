import '../service/product_service.dart';
import 'package:mobx/mobx.dart';
import '../model/product.dart';
import '../model/type.dart';

part 'product_view_model.g.dart';

class ProductViewModel = _ProductViewModelBase with _$ProductViewModel;

abstract class _ProductViewModelBase with Store {
  final ProductService _productService;
  _ProductViewModelBase(this._productService);

  @observable
  List<Product> products = [];

  @observable
  List<Product> updatedProduct = [];

  @observable
  List<Product> wishList = [];

  @observable
  int tabBarIndex = 0;

  @observable
  List<ProductType> productTypes = [];

  @observable
  List<Product> trends = [];

  @observable
  bool isLoading = false;

  @action
  Future<void> init() async {
    changeLoading();
    await getTypes();
    await getUpdated();
    await getTrends();
    changeLoading();
  }

  @action
  void changeTabBar(int value) {
    tabBarIndex = value;
    getUpdated();
    getTrends();
  }

  @action
  Future<void> getTypes() async {
    final response = await _productService.getTypes();
    productTypes = response ?? [];
  }

  @action
  Future<void> getProduct() async {
    products = await _productService.getProduct() ?? [];
  }

  @action
  Future<void> getWishList(String userId) async {
    wishList = await _productService.getWishList(userId) ?? [];
  }

  @action
  Future<void> getUpdated() async {
    updatedProduct = await _productService
            .getUpdated(productTypes[tabBarIndex].id.toString()) ??
        [];
  }

  @action
  Future<void> getTrends() async {
    final response = await _productService
        .getTrends(productTypes[tabBarIndex].id.toString());
    trends = response ?? [];
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
