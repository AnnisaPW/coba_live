part of '../_index.dart';

class ProductEditName extends StatelessWidget {
  const ProductEditName({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxName.st.controller,
        focusNode: _dt.rxName.st.focusNode,
        onEditingComplete: () => _dt.rxPrice.st.focusNode.requestFocus(),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: 'Name',
          isDense: true,
          hintText: 'Name of Product',
          errorText: _dt.rxName.st.error,
        ),
      ),
    );
  }
}
