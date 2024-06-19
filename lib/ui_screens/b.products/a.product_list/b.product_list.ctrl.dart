part of '_index.dart';

class ProductListCtrl {
  init() => logxx.i(ProductListCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  loader() {
    _sv.readProducts();
  }

  select(String id) {
    _sv.setSelectedId(id);
    nav.to(Routes.productDetail);
  }

  createProduct() {
    final product = Product(
      id: const Uuid().v4(),
      name: generateWordPairs().take(2).join(' '),
      price: Random().nextInt(1000000),
      quantity: Random().nextInt(1000),
      createdAt: DateTime.now().toString(),
    );
    _sv.createProduct(product);
    // _dt.rxProductList.refresh();
  }

  updateProduct(String doc) async {
    final index = _pv.rxProductList.st.indexWhere((element) => element.id == doc);
    final productDetail = _dt.rxProductList.st[index];
    final product = Product(
      id: productDetail.id,
      name: generateWordPairs().take(2).join(' '),
      quantity: Random().nextInt(1000),
      price: Random().nextInt(1000000),
      createdAt: productDetail.createdAt,
      updatedAt: DateTime.now().toString(),
    );
    _sv.updateProduct(product);
  }

  deleteProduct(String doc) async {
    await _sv.deleteProduct(doc);
  }
}
