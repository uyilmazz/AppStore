enum NetworkPath { MAIN, TREND, UPDATED }
enum NetworkQueryParameters { PRODUCER, CATEGORY, TYPE }

extension NetworkPathExtension on NetworkPath {
  String get rawValue {
    switch (this) {
      case NetworkPath.MAIN:
        return '/products';
      case NetworkPath.TREND:
        return '/products/trends';
      case NetworkPath.UPDATED:
        return '/products/updated';
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
