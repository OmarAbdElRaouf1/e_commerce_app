abstract class DatabaseService {
  Future<void> add(
      {required String path,
      required Map<String, dynamic> data,
      String? docId});

  Future<dynamic> getData(
      {required String path, String? docId, Map<String, dynamic>? query});

  Future<bool> isUserExist({required String path, required String docId});
}
