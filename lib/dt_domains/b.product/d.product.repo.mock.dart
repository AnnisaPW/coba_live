part of '_index.dart';

class ProductRepoMock implements ProductRepo {
  @override
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.wtf('random value coming from ProductRepoMock');
    return x;
  }

  @override
  Future<List<Product>> readProducts() {
    throw UnimplementedError();
  }

  @override
  Future createProduct(data) {
    throw UnimplementedError();
  }

  @override
  Future deleteProduct(String doc) {
    throw UnimplementedError();
  }

  @override
  Future updateProduct(Product product) {
    throw UnimplementedError();
  }

  @override
  Future<Product> readProduct(String doc) {
    throw UnimplementedError();
  }

  @override
  Future<String> uploadImage(XFile? pickedFile, String doc) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteImage() {
    throw UnimplementedError();
  }
}
