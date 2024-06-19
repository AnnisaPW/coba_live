part of '_index.dart';

class ProductServ {
  void init() {
    logxx.i(ProductServ, '...');
  }

  void updateRandom() {
    _pv.rxRandom.st = _rp.giveNewRandom();
  }

  void onSetState() {
    logzz.i(ProductServ, 'rxCounter setState success');
  }

  readProducts() {
    _pv.rxLoadMore.stateAsync = _rp.readProducts();
  }

  addToList(List<Product> moreProducts) {
    _pv.rxProductList.st = [..._pv.rxProductList.st, ...moreProducts];
    if (moreProducts.length < _pv.limit) {
      _pv.rxIsEnd.st = true;
    }
  }

  Future<void> createProduct(Product product) async {
    await _rp.createProduct(product);
    _pv.rxProductList.st = [..._pv.rxProductList.st]..insert(0, product);
  }

  Future<void> deleteProduct(String doc) async {
    await _rp.deleteProduct(doc);
    _pv.rxProductList.st = [..._pv.rxProductList.st]..removeWhere((element) => element.id == doc);
  }

  Future<void> updateProduct(Product product) async {
    await _rp.updateProduct(product);
    _pv.rxProductList.setState(
      (s) {
        final index = _pv.rxProductList.st.indexWhere((element) => element.id == product.id);
        return s[index] = product;
      },
    );
  }

  readProduct() {
    _pv.rxProductDetail.stateAsync = _rp.readProduct(_pv.rxSelectedId.st);
  }

  setSelectedId(String id) {
    _pv.rxSelectedId.st = id;
  }
}
