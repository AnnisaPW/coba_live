part of '_index.dart';

class ProductDetailCtrl {
  init() => logxx.i(ProductDetailCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  deleteProduct() async {
    await _sv.deleteProduct(_dt.rxSelectedId.st);
    nav.back();
  }
}
