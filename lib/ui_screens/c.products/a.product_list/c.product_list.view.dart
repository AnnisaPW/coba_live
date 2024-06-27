part of '_index.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: ProductListAppbar(),
      ),
      floatingActionButton: const ProductListFab(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OnBuilder.all(
            listenToMany: [_dt.rxProductList, _dt.rxLoadMore],
            onWaiting: () => const CircularProgressIndicator(),
            onError: (error, refreshError) => const Text('Error'),
            onData: (data) => Column(
              children: [
                ...List.generate(
                  _dt.rxProductList.st.length,
                  (index) => Card(
                    color: Colors.grey.withOpacity(0.1),
                    child: OnReactive(
                      () => ListTile(
                        title: Text(_dt.rxProductList.st[index].name),
                        subtitle: Text(_dt.rxProductList.st[index].quantity.toString()),
                        selected: _dt.rxProductList.st[index].id == _dt.rxSelectedId.st,
                        leading: _dt.rxProductList.st[index].imageUrl.isNotEmpty
                            ? SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.network(_dt.rxProductList.st[index].imageUrl),
                              )
                            : null,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _ct.deleteProduct(_dt.rxProductList.st[index].id);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                _ct.updateProduct(_dt.rxProductList.st[index].id);
                              },
                              icon: const Icon(Icons.loop),
                            ),
                          ],
                        ),
                        onTap: () => _ct.select(_dt.rxProductList.st[index].id),
                      ),
                    ),
                  ),
                ),
                const SizedBoxH(15),
                Center(
                  child: _dt.rxIsEnd.st == true
                      ? const Text('end of list')
                      : OutlinedButton(
                          onPressed: () => _ct.loader(),
                          child: const Text('load more'),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
