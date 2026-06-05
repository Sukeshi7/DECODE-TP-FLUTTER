import '../../services/api_service.dart';
import '../models/paginated_response.dart';
import '../models/product_model.dart';

class ProductRepository {
  Future<PaginatedResponse<Product>> getProducts({
    int page = 1,
    int limit = 10,
    String? search,
  }) {
    return ApiService().request(
      uri: 'products',
      httpMethod: HttpMethod.get,
      queryParams: {
        'page': page.toString(),
        'limit': limit.toString(),
        if (search != null && search.isNotEmpty) 'searchValue': search,
      },
      parser: (res) => PaginatedResponse.fromJson(
        res,
            (json) => Product.fromJson(json),
      ),
    );
  }

  Future<Product> createProduct(Map<String, dynamic> data) {
    return ApiService().request(
      uri: 'products',
      httpMethod: HttpMethod.post,
      data: data,
      parser: (res) => Product.fromJson(res),
    );
  }

  Future<Product> updateProduct(String id, Map<String, dynamic> data) {
    return ApiService().request(
      uri: 'products',
      httpMethod: HttpMethod.put,
      id: id,
      data: data,
      parser: (res) => Product.fromJson(res),
    );
  }

  Future<void> deleteProduct(String id) {
    return ApiService().request(
      uri: 'products',
      httpMethod: HttpMethod.delete,
      id: id,
    );
  }
}
