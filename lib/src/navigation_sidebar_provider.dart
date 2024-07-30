class NavSidebarProvider {
  static final NavSidebarProvider _instance = NavSidebarProvider._internal();
  bool _isExtended = false;

  factory NavSidebarProvider() {
    return _instance;
  }

  NavSidebarProvider._internal();

  bool get isExtended => _isExtended;

  set isExtended(bool value) {
    _isExtended = value;
    // You might want to add a notification mechanism here if needed
  }
}
