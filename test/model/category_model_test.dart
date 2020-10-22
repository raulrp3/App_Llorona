import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:llorona_app/models/category/category.dart';

import '../fake/category_fake.dart';
import '../fixtures/fixture_reader.dart';

void main() {
  group(
    'category',
    () {
      test(
        'Category fromJson should return a valid model',
        () async {
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('category.json'));

          final result = Category.fromJson(jsonMap);

          expect(result, tCategory);
        },
      );
    },
  );
}
