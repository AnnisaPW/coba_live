part of '_index.dart';

class ProductInputCtrl {
  init() => logxx.i(ProductInputCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  createProduct() async {
    final product = Product(
      id: const Uuid().v4(),
      name: _dt.rxName.value,
      price: int.parse(_dt.rxPrice.value),
      quantity: int.parse(_dt.rxQuantity.value),
      createdAt: DateTime.now().toString(),
    );
    await _sv.createProduct(product);
    nav.back();
  }

  submit() => _dt.rxForm.submit();
}
