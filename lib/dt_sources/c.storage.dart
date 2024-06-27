part of '_index.dart';

final x1FbStorage = RM.inject(() => FbStorage(), debugPrintWhenNotifiedPreMessage: '');

class FbStorage {
  Future<String> uploadFile({
    required XFile? pickedFile,
    required String ref,
  }) async {
    String imageUrl = '';
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      final snapshot = await FirebaseStorage.instance.ref(ref).putData(
            imageBytes,
            SettableMetadata(contentType: pickedFile.mimeType),
          );
      imageUrl = await snapshot.ref.getDownloadURL();
    }
    return imageUrl;
  }

  Future<void> deleteFile(String ref) async {
    await FirebaseStorage.instance.ref(ref).delete();
  }
}
