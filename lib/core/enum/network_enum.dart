enum NetworkProductPath { MAIN, TREND, UPDATED, WISHLIST }
enum NetworkUserPath { MAIN, LOGIN, REGISTER, VERIFYTOKEN }
enum NetworkQueryParameters { PRODUCER, CATEGORY, TYPE }
enum Token { KEY }

extension NetworkProductPathExtension on NetworkProductPath {
  String get rawValue {
    switch (this) {
      case NetworkProductPath.MAIN:
        return '/products';
      case NetworkProductPath.TREND:
        return '/products/trends';
      case NetworkProductPath.UPDATED:
        return '/products/updated';
      case NetworkProductPath.WISHLIST:
        return '/products/wishList';
    }
  }
}

extension NetworkUserPathExtension on NetworkUserPath {
  String get rawValue {
    switch (this) {
      case NetworkUserPath.MAIN:
        return '/users';
      case NetworkUserPath.LOGIN:
        return '/users/login';
      case NetworkUserPath.REGISTER:
        return '/users/register';
      case NetworkUserPath.VERIFYTOKEN:
        return '/users/verify';
    }
  }
}

extension NetworkQueryExtension on NetworkQueryParameters {
  MapEntry<String, dynamic> rawValue(value) {
    switch (this) {
      case NetworkQueryParameters.PRODUCER:
        return MapEntry('producer', value);
      case NetworkQueryParameters.CATEGORY:
        return MapEntry('category', value);
      case NetworkQueryParameters.TYPE:
        return MapEntry('typeId', value);
    }
  }
}

extension TokenExtension on Token {
  String get rawValue {
    switch (this) {
      case Token.KEY:
        return 'token';
    }
  }
}
