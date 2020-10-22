import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:llorona_app/models/product/product.dart';

import '../fake/product_fake.dart';
import '../fixtures/fixture_reader.dart';

void main() {
  group(
    'product',
    () {
      test(
        'Product fromJson should return a valid model',
        () async {
          final Map<String, dynamic> jsonMap = json.decode(fixture('product.json'));

          final result = Product.fromJson(jsonMap);

          expect(result, tProduct);
        },
      );
    },
  );
}
