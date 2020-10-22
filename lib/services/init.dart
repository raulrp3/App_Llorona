
import 'package:llorona_app/api/categories/category_api_service.dart';
import 'package:llorona_app/api/products/product_api_service.dart';

CategoryApiService categoryApiService;
ProductApiService productApiService;

void initServices() {
  categoryApiService = CategoryApiService.create();
  productApiService = ProductApiService.create();
}