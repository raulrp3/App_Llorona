import 'package:flutter/material.dart';
import 'package:llorona_app/models/category/category.dart';

class CategoryProvider with ChangeNotifier {
  Category _category = Category();

  Category get category => _category;

  set category(Category category) {
    _category = category;
    notifyListeners();
  }
}