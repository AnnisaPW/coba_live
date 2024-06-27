part of '_index.dart';

class ProductListData {
  final rxTitle = 'Product List'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxProductList = _pv.rxProductList;

  final rxLoadMore = _pv.rxLoadMore;

  final rxSelectedId = _pv.rxSelectedId;

  final rxIsEnd = _pv.rxIsEnd;
}
