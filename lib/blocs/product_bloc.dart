import 'dart:convert';
import 'package:llorona_app/models/product/product.dart';
import 'bloc_base.dart';
import 'package:rxdart/rxdart.dart';
import 'package:llorona_app/services/init.dart';

class ProductBloc extends BlocBase {
  final _productStream = BehaviorSubject<List<Product>>();

  Stream<List<Product>> get stream => _productStream.stream;

  List<Product> get products => _productStream.value;

  void setProducts(List<Product> value) {
    _productStream.sink.add(value);
  }

  Future<void> fetchProducts(categoryId) async {
    final data = await productApiService.getProducts(categoryId);
    final List<Product> mProducts = [];

    for (final product in json.decode(data.body['data'])) {
      mProducts.add(Product(
          id: product['id'],
          name: product['name'],
          price: product['price'],
          image: product['image'],
          content: product['content'],
          excerpt: product['excerpt']));
    }

    this.setProducts(mProducts);
  }

  void filterProducts(String searchValue) {
    var _products = this.products;

    _products = _products
        .where((element) => element.name.toLowerCase().contains(searchValue))
        .toList();
    this.setProducts(_products);
  }

  @override
  void dispose() {
    _productStream.close();
  }
}

final productBloc = ProductBloc();
