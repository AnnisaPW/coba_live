part of '../_index.dart';

class ProductInputName extends StatelessWidget {
  const ProductInputName({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxName.controller,
        focusNode: _dt.rxName.focusNode,
        onEditingComplete: () => _dt.rxPrice.focusNode.requestFocus(),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: 'Name',
          isDense: true,
          hintText: 'Name of Product',
          errorText: _dt.rxName.error,
        ),
      ),
    );
  }
}
