part of '../_index.dart';

class ProductEditImage extends StatelessWidget {
  const ProductEditImage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => Column(
        children: [
          _dt.rxPickedFile.st == null
              ? Visibility(
                  visible: _dt.rxProductDetail.st!.imageUrl.isNotEmpty,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: OnReactive(
                      () => kIsWeb
                          ? Image.network(_dt.rxProductDetail.st!.imageUrl)
                          : Image.file(
                              File(_dt.rxProductDetail.st!.imageUrl),
                            ),
                    ),
                  ),
                )
              : SizedBox(
                  width: 200,
                  height: 200,
                  child: OnReactive(
                    () => kIsWeb
                        ? Image.network(_dt.rxPickedFile.st!.path)
                        : Image.file(
                            File(_dt.rxPickedFile.st!.path),
                          ),
                  ),
                ),
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
