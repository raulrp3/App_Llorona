import 'dart:convert';
import 'package:llorona_app/models/category/category.dart';
import 'bloc_base.dart';
import 'package:rxdart/rxdart.dart';
import 'package:llorona_app/services/init.dart';

class CategoryBloc extends BlocBase {
  final _categoryStream = BehaviorSubject<List<Category>>();

  Stream<List<Category>> get stream => _categoryStream.stream;

  List<Category> get categories => _categoryStream.value;

  void setCategories(List<Category> value) {
    _categoryStream.sink.add(value);
  }

  void fetchCategories() {
    categoryApiService.getCategories().then((value) {
      final List<Category> mCategories = [];

      for (final category in json.decode(value.body['data'])) {
        mCategories.add(Category(id: category['id'], name: category['name']));
      }

      this.setCategories(mCategories);
    });
  }
  
  @override
  void dispose() {
    _categoryStream.close();
  }
}

final categoryBloc = CategoryBloc();