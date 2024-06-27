part of '_index.dart';

class ProductInputCtrl {
  init() => logxx.i(ProductInputCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  pickImage() async {
    final imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);
    _dt.rxPickedFile.st = imagePicker;
  }

  createProduct() async {
    final product = Product(
      id: const Uuid().v4(),
      name: _dt.rxName.value,
      price: int.parse(_dt.rxPrice.value),
      quantity: int.parse(_dt.rxQuantity.value),
      createdAt: DateTime.now().toString(),
    );
    final imageUrl = await _sv.uploadImage(_dt.rxPickedFile.st, product.id);
    final productWithImage = product.copyWith(imageUrl: imageUrl);
    await _sv.createProduct(productWithImage);
    nav.back();
  }

  submit() => _dt.rxForm.submit();
}
