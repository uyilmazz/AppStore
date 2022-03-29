class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance => _instace ??= ImageConstants._init();
  ImageConstants._init();

  String get loginSvg => toSvg('login');
  String toSvg(String name) => 'assets/svg/$name.svg';
}
