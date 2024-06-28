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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OnBuilder.all(
          listenToMany: [_dt.rxLoadMore],
          onWaiting: () => _dt.rxProductList.st.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const ProductListCards(),
          onError: (error, refreshError) => Text('Error: $error'),
          onData: (data) => const ProductListCards(),
        ),
      ),
    );
  }
}

class ProductListCards extends StatelessWidget {
  const ProductListCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _dt.rxProductList.st.isEmpty
        ? const Center(child: Text('Tidak ada data produk'))
        : SingleChildScrollView(
            child: Column(
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
                // const SizedBoxH(10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 35, 20, 30),
                  child: OnBuilder.all(
                    listenToMany: [_dt.rxLoadMore],
                    onWaiting: () => const Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      ),
                    ),
                    onError: (error, refreshError) => error,
                    onData: (data) => _dt.rxIsEnd.st == true
                        ? const Center(child: Text('~~ End of list ~~'))
                        : OutlinedButton(
                            child: const Text('Load more'),
                            onPressed: () => _ct.loader(),
                          ),
                  ),
                ),
              ],
            ),
          );
  }
}
