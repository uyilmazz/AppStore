// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductViewModel on _ProductViewModelBase, Store {
  final _$productsAtom = Atom(name: '_ProductViewModelBase.products');

  @override
  List<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$updatedProductAtom =
      Atom(name: '_ProductViewModelBase.updatedProduct');

  @override
  List<Product> get updatedProduct {
    _$updatedProductAtom.reportRead();
    return super.updatedProduct;
  }

  @override
  set updatedProduct(List<Product> value) {
    _$updatedProductAtom.reportWrite(value, super.updatedProduct, () {
      super.updatedProduct = value;
    });
  }

  final _$wishListAtom = Atom(name: '_ProductViewModelBase.wishList');

  @override
  List<Product> get wishList {
    _$wishListAtom.reportRead();
    return super.wishList;
  }

  @override
  set wishList(List<Product> value) {
    _$wishListAtom.reportWrite(value, super.wishList, () {
      super.wishList = value;
    });
  }

  final _$searchListAtom = Atom(name: '_ProductViewModelBase.searchList');

  @override
  List<Product>? get searchList {
    _$searchListAtom.reportRead();
    return super.searchList;
  }

  @override
  set searchList(List<Product>? value) {
    _$searchListAtom.reportWrite(value, super.searchList, () {
      super.searchList = value;
    });
  }

  final _$tabBarIndexAtom = Atom(name: '_ProductViewModelBase.tabBarIndex');

  @override
  int get tabBarIndex {
    _$tabBarIndexAtom.reportRead();
    return super.tabBarIndex;
  }

  @override
  set tabBarIndex(int value) {
    _$tabBarIndexAtom.reportWrite(value, super.tabBarIndex, () {
      super.tabBarIndex = value;
    });
  }

  final _$productTypesAtom = Atom(name: '_ProductViewModelBase.productTypes');

  @override
  List<ProductType> get productTypes {
    _$productTypesAtom.reportRead();
    return super.productTypes;
  }

  @override
  set productTypes(List<ProductType> value) {
    _$productTypesAtom.reportWrite(value, super.productTypes, () {
      super.productTypes = value;
    });
  }

  final _$trendsAtom = Atom(name: '_ProductViewModelBase.trends');

  @override
  List<Product> get trends {
    _$trendsAtom.reportRead();
    return super.trends;
  }

  @override
  set trends(List<Product> value) {
    _$trendsAtom.reportWrite(value, super.trends, () {
      super.trends = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProductViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_ProductViewModelBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getTypesAsyncAction = AsyncAction('_ProductViewModelBase.getTypes');

  @override
  Future<void> getTypes() {
    return _$getTypesAsyncAction.run(() => super.getTypes());
  }

  final _$getProductAsyncAction =
      AsyncAction('_ProductViewModelBase.getProduct');

  @override
  Future<void> getProduct() {
    return _$getProductAsyncAction.run(() => super.getProduct());
  }

  final _$getWishListAsyncAction =
      AsyncAction('_ProductViewModelBase.getWishList');

  @override
  Future<void> getWishList(String userId) {
    return _$getWishListAsyncAction.run(() => super.getWishList(userId));
  }

  final _$getUpdatedAsyncAction =
      AsyncAction('_ProductViewModelBase.getUpdated');

  @override
  Future<void> getUpdated() {
    return _$getUpdatedAsyncAction.run(() => super.getUpdated());
  }

  final _$getTrendsAsyncAction = AsyncAction('_ProductViewModelBase.getTrends');

  @override
  Future<void> getTrends() {
    return _$getTrendsAsyncAction.run(() => super.getTrends());
  }

  final _$getAllSearchQueryAsyncAction =
      AsyncAction('_ProductViewModelBase.getAllSearchQuery');

  @override
  Future<void> getAllSearchQuery(String value) {
    return _$getAllSearchQueryAsyncAction
        .run(() => super.getAllSearchQuery(value));
  }

  final _$_ProductViewModelBaseActionController =
      ActionController(name: '_ProductViewModelBase');

  @override
  void changeTabBar(int value) {
    final _$actionInfo = _$_ProductViewModelBaseActionController.startAction(
        name: '_ProductViewModelBase.changeTabBar');
    try {
      return super.changeTabBar(value);
    } finally {
      _$_ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchListNull() {
    final _$actionInfo = _$_ProductViewModelBaseActionController.startAction(
        name: '_ProductViewModelBase.searchListNull');
    try {
      return super.searchListNull();
    } finally {
      _$_ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_ProductViewModelBaseActionController.startAction(
        name: '_ProductViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
updatedProduct: ${updatedProduct},
wishList: ${wishList},
searchList: ${searchList},
tabBarIndex: ${tabBarIndex},
productTypes: ${productTypes},
trends: ${trends},
isLoading: ${isLoading}
    ''';
  }
}
