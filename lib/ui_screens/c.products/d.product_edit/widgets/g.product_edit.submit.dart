part of '../_index.dart';

class ProductEditSubmit extends StatelessWidget {
  const ProductEditSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => OnFormSubmissionBuilder(
        listenTo: _dt.rxForm,
        onSubmitting: () => const CircularProgressIndicator(),
        child: OutlinedButton(
          onPressed: () => _ct.submit(),
          child: const Text('Submit'),
        ),
      ),
    );
  }
}
