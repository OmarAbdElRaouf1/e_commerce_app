abstract class DatabaseService {
  Future<void> add({required String path, required Map<String, dynamic> data, String? docId});

  Future<Map<String, dynamic>> getData({required String path, required String docId});

  Future<bool> isUserExist({required String path, required String docId});
}
