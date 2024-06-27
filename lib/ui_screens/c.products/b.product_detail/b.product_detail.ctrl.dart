part of '_index.dart';

class ProductDetailCtrl {
  init() => logxx.i(ProductDetailCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  deleteProduct() async {
    logx.wtf(_pv.rxSelectedId.st);
    await _sv.deleteProduct(_pv.rxSelectedId.st);
    nav.back();
  }
}
