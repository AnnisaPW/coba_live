part of '../_index.dart';

class ProductDetailAppbar extends StatelessWidget {
  const ProductDetailAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: OnReactive(() => Text(_dt.rxTitle.st)),
      actions: [
        IconButton(
          onPressed: () => _ct.deleteProduct(),
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
