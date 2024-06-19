part of '../_index.dart';

class ProductEditPrice extends StatelessWidget {
  const ProductEditPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxPrice.st.controller,
        focusNode: _dt.rxPrice.st.focusNode,
        onEditingComplete: () => _dt.rxQuantity.st.focusNode.requestFocus(),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: 'Price',
          isDense: true,
          hintText: 'E.g. 10000',
          errorText: _dt.rxPrice.st.error,
        ),
      ),
    );
  }
}
