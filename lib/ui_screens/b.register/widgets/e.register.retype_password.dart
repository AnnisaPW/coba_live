part of '../_index.dart';

class RegisterRetypePassword extends StatelessWidget {
  const RegisterRetypePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxRetypePassword.controller,
        focusNode: _dt.rxRetypePassword.focusNode,
        onEditingComplete: () => _dt.rxRetypePassword.focusNode.unfocus(),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          isDense: true,
          labelText: 'Retype Password',
          hintText: 'Retype your password',
          errorText: _dt.rxRetypePassword.error,
          prefixIcon: const Icon(Icons.password),
        ),
      ),
    );
  }
}
