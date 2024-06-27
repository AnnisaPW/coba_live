part of '_index.dart';

class ProductInputData {
  final rxTitle = 'Product Input'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxForm = RM.injectForm(
    submit: () async => await _ct.createProduct(),
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );

  final rxName = RM.injectTextEditing(
    validators: [
      Validate.isNotEmpty,
    ],
  );

  final rxPrice = RM.injectTextEditing(
    validators: [
      Validate.isNotEmpty,
      Validate.isNumeric,
    ],
  );

  final rxQuantity = RM.injectTextEditing(validators: [
    Validate.isNotEmpty,
    Validate.isNumeric,
  ]);

  final rxPickedFile = RM.inject<XFile?>(() => null);
}
