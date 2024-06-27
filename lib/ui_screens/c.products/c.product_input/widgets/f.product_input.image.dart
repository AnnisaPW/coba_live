part of '../_index.dart';

class ProductInputImage extends StatelessWidget {
  const ProductInputImage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => Column(
        children: [
          _dt.rxPickedFile.st != null
              ? SizedBox(
                  width: 200,
                  height: 200,
                  child: kIsWeb
                      ? Image.network(_dt.rxPickedFile.st!.path)
                      : Image.file(
                          File(_dt.rxPickedFile.st!.path),
                        ),
                )
              : const SizedBox.shrink(),
          OutlinedButton(
            onPressed: () {
              _ct.pickImage();
            },
            child: const Text('upload image'),
          ),
        ],
      ),
    );
  }
}
