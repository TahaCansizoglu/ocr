class INavigationService {
  Future<void> navigateToPage({required String path, Object? data}) async {}

  Future<void> navigateToPageClear(
      {required String path, Object? data}) async {}

  void popPage() {}
}
