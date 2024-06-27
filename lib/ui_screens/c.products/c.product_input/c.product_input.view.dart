part of '_index.dart';

class ProductInputView extends StatelessWidget {
  const ProductInputView({super.key});

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
          child: ProductInputAppbar(),
        ),
        floatingActionButton: const ProductInputFab(),
        body: OnFormBuilder(
          listenTo: _dt.rxForm,
          builder: () {
            return Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProductInputName(),
                    SizedBoxH(15),
                    ProductInputPrice(),
                    SizedBoxH(15),
                    ProductInputQuantity(),
                    SizedBoxH(20),
                    ProductInputImage(),
                    SizedBoxH(15),
                    ProductInputSubmit(),
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
