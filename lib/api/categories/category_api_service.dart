import 'package:chopper/chopper.dart';

part 'category_api_service.chopper.dart';

@ChopperApi(baseUrl: '/categories.php')
abstract class CategoryApiService extends ChopperService {
  @Get()
  Future<Response> getCategories();

  static CategoryApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://10.0.2.2/llorona',
      services: [
        _$CategoryApiService(),
      ],
      converter: JsonConverter(),
    );

    return _$CategoryApiService(client);
  }
}