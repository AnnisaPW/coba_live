part of '_index.dart';

class ProductEditData {
  final rxTitle = 'Product Edit'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxProductDetail = _pv.rxProductDetail;

  final rxForm = RM.injectForm(
    submit: () async => await _ct.updateProduct(),
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );

  final rxName = RM.inject(
    () => RM.injectTextEditing(
      text: _dt.rxProductDetail.st!.name,
      validators: [
        Validate.isNotEmpty,
      ],
    ),
  );

  final rxPrice = RM.inject(
    () => RM.injectTextEditing(
      text: _dt.rxProductDetail.st!.price.toString(),
      validators: [
        Validate.isNotEmpty,
        Validate.isNumeric,
      ],
    ),
  );

  final rxQuantity = RM.inject(
    () => RM.injectTextEditing(
      text: _dt.rxProductDetail.st!.quantity.toString(),
      validators: [
        Validate.isNotEmpty,
        Validate.isNumeric,
      ],
    ),
  );
}
