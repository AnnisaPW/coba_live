part of '_index.dart';

class ProductProv {
  final rxRandom = RM.inject<int>(
    () => 0,
    autoDisposeWhenNotUsed: false,
    sideEffects: SideEffects(
      onSetState: (p0) => _sv.onSetState(),
    ),
  );

  final limit = 3;

  final rxImageUrl = ''.inj();

  final coll = 'products';

  final rxIsEnd = false.inj();

  final rxLoadMore = RM.injectFuture<List<Product>>(() => Future.value([]),
      sideEffects: SideEffects(
        initState: () => _sv.readProducts(),
        onSetState: (snap) {
          if (snap.hasData) {
            final moreProduct = snap.state.whereType<Product>().toList();
            _sv.addToList(moreProduct);
          }
        },
      ));

  final rxProductList = RM.inject<List<Product>>(() => []);

  final rxProductDetail = RM.injectFuture<Product?>(
    () => Future.value(null),
    sideEffects: SideEffects(
      initState: () => _sv.readProduct(),
    ),
  );

  final rxSelectedId = RM.inject<String>(() => '');
}
