part of '_index.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: ProductDetailAppbar(),
      ),
      floatingActionButton: const ProductDetailFab(),
      body: Center(
        child: OnBuilder.all(
          listenTo: _dt.rxProductDetail,
          onWaiting: () => const CircularProgressIndicator(),
          onError: (error, refreshError) => Text('$error'),
          onData: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${data?.id}'),
              Text('${data?.name}'),
              Text('${data?.quantity}'),
              Text('${data?.price}'),
              Text('${data?.createdAt}'),
              Text('${data?.updatedAt}'),
            ],
          ),
        ),
      ),
    );
  }
}
