part of '../_index.dart';

class RegisterPassword extends StatelessWidget {
  const RegisterPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxPassword.controller,
        focusNode: _dt.rxPassword.focusNode,
        onEditingComplete: () => _dt.rxRetypePassword.focusNode.requestFocus(),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          isDense: true,
          labelText: 'Password',
          hintText: 'Enter your password',
          errorText: _dt.rxPassword.error,
          prefixIcon: const Icon(Icons.password),
        ),
      ),
    );
  }
}
