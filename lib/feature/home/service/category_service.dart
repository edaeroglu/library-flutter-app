// import 'package:dio/dio.dart';

// class CategoryService {
//   static const baseUrl = 'https://assign-api.piton.com.tr/api/rest';

//   static Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

//   static Future<String> getCategories() async {
//     try {
//       final response = await dio.get('/categories');
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception('Failed to load categories');
//       }
//     } catch (e) {
//       throw Exception('Failed to load categories');
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:mobile_app/feature/home/model/category_model.dart';

import '../../../product/model/contents_model.dart';

abstract class ICategoryService {
  ICategoryService(this.dio);
  final Dio dio;

  Future<List<CategoryModel>?> getCategories();
  Future<List<ContentModel>?> getContents(int index);
  Future<String> getProductImage({required String cover});

  // Future<String> getProductImage({required String cover});
}

class CategoryService extends ICategoryService {
  CategoryService(Dio dio) : super(dio);
  List<dynamic> categoriesList = [];

  @override
  Future<List<CategoryModel>?> getCategories() async {
    final response = await dio.get('/categories');
    if (response.statusCode == 200) {
      final jsonBody = response.data["category"];
      if (jsonBody is List) {
        return jsonBody.map((json) => CategoryModel.fromJson(json)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<ContentModel>?> getContents(int index) async {
    final response = await dio.get('/products/${index + 1}');
    if (response.statusCode == 200) {
      final jsonBody = response.data["product"];
      //categoriesList.addAll(response.data);

      if (jsonBody is List) {
        return jsonBody.map((json) => ContentModel.fromJson(json)).toList();
      }

      return null;
    }
    return null;

    
  }

  @override
  Future<String> getProductImage({required String cover}) async {
    try {
      final response =
          await dio.post('/cover_image', data: {'fileName': cover});
      if (response.statusCode == 200) {
        final jsonBody = response.data["action_product_image"]["url"];
        return jsonBody;
      }
      return "";
    } on DioError catch (e) {
      print(e.response);
      return "";
    }
  }
}
