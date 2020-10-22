// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ProductApiService extends ProductApiService {
  _$ProductApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ProductApiService;

  @override
  Future<Response<dynamic>> getProducts(int categoryId) {
    final $url = '/products.php/$categoryId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
