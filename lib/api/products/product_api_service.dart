import 'package:chopper/chopper.dart';

part 'product_api_service.chopper.dart';

@ChopperApi(baseUrl: '/products.php')
abstract class ProductApiService extends ChopperService {
  @Get(path: '/{category}')
  Future<Response> getProducts(@Path('category') int categoryId);

  static ProductApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://10.0.2.2/llorona',
      services: [
        _$ProductApiService(),
      ],
      interceptors: [
        (Request request) async {
          if (request.method == HttpMethod.Get) {
            final List<String> _url = request.url.split('/');
            request = request.copyWith(
              url: '/${_url[1]}?category=${_url[2]}',
            );
          }

          return request;
        }
      ],
      converter: JsonConverter(),
    );

    return _$ProductApiService(client);
  }
}