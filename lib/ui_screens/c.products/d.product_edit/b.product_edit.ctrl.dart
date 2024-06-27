part of '_index.dart';

class ProductEditCtrl {
  init() => logxx.i(ProductEditCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  pickImage() async {
    final imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);
    _dt.rxPickedFile.st = imagePicker;
  }

  updateProduct() async {
    Product product = Product(
      id: _dt.rxProductDetail.st!.id,
      name: _dt.rxName.st.value,
      price: int.parse(_dt.rxPrice.st.value),
      quantity: int.parse(_dt.rxQuantity.st.value),
      createdAt: _dt.rxProductDetail.st!.createdAt,
      updatedAt: DateTime.now().toString(),
    );
    if (_dt.rxPickedFile.st != null) {
      final imageFromStorage = await _sv.uploadImage(_dt.rxPickedFile.st, product.id);
      final productWithImage = product.copyWith(imageUrl: imageFromStorage);
      product = productWithImage;
    }
    await _sv.updateProduct(product);
    nav.back();
    nav.back();
  }

  submit() => _dt.rxForm.submit();
}
