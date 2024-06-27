part of '../_index.dart';

class RegisterSubmit extends StatelessWidget {
  const RegisterSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => OnFormSubmissionBuilder(
        listenTo: _dt.rxForm,
        onSubmitting: () => const CircularProgressIndicator(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(200),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: _dt.rxForm.isValid && _dt.rxForm.isDirty
              ? () {
                  _ct.submit();
                }
              : null,
          child: const Text(
            "Submit",
          ),
        ),
      ),
    );
  }
}
