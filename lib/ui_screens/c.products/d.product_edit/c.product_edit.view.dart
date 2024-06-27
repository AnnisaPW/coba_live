part of '_index.dart';

class ProductEditView extends StatelessWidget {
  const ProductEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: ProductEditAppbar(),
        ),
        floatingActionButton: const ProductEditFab(),
        body: OnFormBuilder(
          listenTo: _dt.rxForm,
          builder: () {
            return Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProductEditName(),
                    SizedBoxH(15),
                    ProductEditPrice(),
                    SizedBoxH(15),
                    ProductEditQuantity(),
                    SizedBoxH(20),
                    ProductEditImage(),
                    SizedBoxH(15),
                    ProductEditSubmit(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
