part of '_index.dart';

class ProductRepo {
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.s('random value coming from ProductRepo');
    return x;
  }

  Future<List<Product>> readProducts() async {
    List<Product> products = [];
    final result = await x1FbFirestore.st.readCollection(
      'products',
      _pv.limit,
      _pv.rxProductList.st.isNotEmpty ? _pv.rxProductList.st.last.createdAt : '9999-99-99 99:99:99.999',
    );
    for (var product in result.docs) {
      products.add(Product.fromMap(product.data()));
    }
    return products;
  }

  Future<dynamic> createProduct(Product product) async {
    await x1FbFirestore.st.createDocument('products', product.id, product);
  }

  Future<dynamic> deleteProduct(String doc) async {
    await x1FbFirestore.st.deleteDocument('products', doc);
  }

  Future<dynamic> updateProduct(Product product) async {
    await x1FbFirestore.st.updateDocument('products', product.id, product);
  }

  Future<Product> readProduct(String doc) async {
    final result = await x1FbFirestore.st.readDocument('products', doc);
    return Product.fromMap(result.data() ?? {});
  }
}
