extension StringExtension on String {
  String get toPng => 'assets/$this.png';
  String get fortniteToPng => 'assets/fortnite/$this.png';
  String get toIconPng => 'assets/icon/$this.png';
  String networkUrl() {
    return 'http://10.0.2.2:3000/$this';
  }

  bool get emailRegex => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(this);
}
