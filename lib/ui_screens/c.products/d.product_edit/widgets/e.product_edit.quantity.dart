part of '../_index.dart';

class ProductEditQuantity extends StatelessWidget {
  const ProductEditQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxQuantity.st.controller,
        focusNode: _dt.rxQuantity.st.focusNode,
        onEditingComplete: () => _dt.rxQuantity.st.focusNode.unfocus(),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: 'Quantity',
          isDense: true,
          hintText: 'E.g. 100',
          errorText: _dt.rxQuantity.st.error,
        ),
      ),
    );
  }
}
