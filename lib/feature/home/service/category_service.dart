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
  Future<List<ContentModel>?> getContentItem();
  Future<List<ContentModel>?> getContentClassics();
  Future<List<ContentModel>?> getContentChildren();
  Future<List<ContentModel>?> getContentPhilosophy();


}

class CategoryService extends ICategoryService {
  CategoryService(Dio dio) : super(dio);

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
  Future<List<ContentModel>?> getContentItem() async {
    final response = await dio.get('/products/1');
    if (response.statusCode == 200) {
      final jsonBody = response.data["product"];
      if (jsonBody is List) {
        return jsonBody.map((json) => ContentModel.fromJson(json)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<ContentModel>?> getContentClassics() async {
    final response = await dio.get('/products/2');
    if (response.statusCode == 200) {
      final jsonBody = response.data["product"];
      if (jsonBody is List) {
        return jsonBody.map((json) => ContentModel.fromJson(json)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<ContentModel>?> getContentChildren() async {
    final response = await dio.get('/products/3');
    if (response.statusCode == 200) {
      final jsonBody = response.data["product"];
      if (jsonBody is List) {
        return jsonBody.map((json) => ContentModel.fromJson(json)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<ContentModel>?> getContentPhilosophy() async {
    final response = await dio.get('/products/4');
    if (response.statusCode == 200) {
      final jsonBody = response.data["product"];
      if (jsonBody is List) {
        return jsonBody.map((json) => ContentModel.fromJson(json)).toList();
      }
    }
    return null;
  }
}

//--------------------------------------------------------------------------------------------------------


// abstract class ICategoryId {
//   ICategoryId(this.dio);
//   final Dio dio;

//   Future<List<CategoryId>?> getCategoryId();
// }

// class CategoryId extends ICategoryId {
//   CategoryId(Dio dio) : super(dio);

//   @override
//   Future<List<CategoryId>?> getCategoryId() async {
//     final response = await dio.get('/products/1');
//     if (response.statusCode == 200) {
      
//       final jsonBody = response.data["product"];
//       if (jsonBody is List) {
//         return jsonBody.map((json) => CategoryId.fromJson(json)).toList();
//       }
//     }
//     return null;
//   }
// }

















// class MyApi {
//   static const baseUrl = 'https://assign-api.piton.com.tr/api/rest/categories';

//   static Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

//   static Future<String> login(String username, String password) async {
//     try {
//       final response = await dio.post(
//         '/login',
//         data: {
//           'username': username,
//           'password': password,
//         },
//       );
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception('Failed to log in');
//       }
//     } catch (e) {
//       throw Exception('Failed to log in');
//     }
//   }

//   static Future<String> register(String username, String password) async {
//     try {
//       final response = await dio.post(
//         '/register',
//         data: {
//           'username': username,
//           'password': password,
//         },
//       );
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception('Failed to register');
//       }
//     } catch (e) {
//       throw Exception('Failed to register');
//     }
//   }

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

//   static Future<String> getProductsByCategoryId(String categoryId) async {
//     try {
//       final response = await dio.get('/products', queryParameters: {
//         'categoryId': categoryId,
//       });
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception('Failed to load products');
//       }
//     } catch (e) {
//       throw Exception('Failed to load products');
//     }
//   }

//   static Future<String> getProduct(String productId) async {
//     try {
//       final response = await dio.get('/product/$productId');
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception('Failed to load product');
//       }
//     } catch (e) {
//       throw Exception('Failed to load product');
//     }
//   }

//   static Future<String> postProductCoverImage(
//       String productId, String imagePath) async {
//     try {
//       FormData formData = FormData.fromMap({
//         'image': await MultipartFile.fromFile(imagePath),
//       });
//       final response = await dio.post('/product/$productId/cover-image',
//           data: formData, options: Options(contentType: 'multipart/form-data'));
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception('Failed to post product cover image');
//       }
//     } catch (e) {
//       throw Exception('Failed to post product cover image');
//     }
//   }
// }
