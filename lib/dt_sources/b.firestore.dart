part of '_index.dart';

final x1FbFirestore = RM.inject(() => FbFirestore(), debugPrintWhenNotifiedPreMessage: '');

class FbFirestore {
  Future<QuerySnapshot<Map<String, dynamic>>> readCollection(String coll, int limit, String lastCreateTime) async {
    final result = await FirebaseFirestore.instance
        .collection(coll)
        .limit(limit)
        .orderBy('created_at', descending: true)
        .startAfter([lastCreateTime]).get();
    return result;
  }

  Future<dynamic> createDocument(String coll, String doc, dynamic data) async {
    await FirebaseFirestore.instance.collection(coll).doc(doc).set(
          data.toMap(),
        );
  }

  Future<dynamic> deleteDocument(String coll, String doc) async {
    await FirebaseFirestore.instance.collection(coll).doc(doc).delete();
  }

  Future<dynamic> updateDocument(String coll, String doc, dynamic data) async {
    await FirebaseFirestore.instance.collection(coll).doc(doc).update(data.toMap());
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> readDocument(String coll, String doc) async {
    final result = await FirebaseFirestore.instance.collection(coll).doc(doc).get();
    return result;
  }
}
