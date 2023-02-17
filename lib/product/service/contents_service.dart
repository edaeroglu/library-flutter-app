// import 'package:dio/dio.dart';


// import '../../feature/home/model/category_model.dart';

// abstract class IContentService {
//   IContentService(this.dio);
//   final Dio dio;

//   Future<List<ContentModel>?> getContentItem();
// }

// class ContentService extends IContentService {
//   ContentService(Dio dio) : super(dio);

//   @override
//   Future<List<ContentModel>?> getContentItem() async {
//     final response = await dio.get('/products/1');
//     if (response.statusCode == 200) {
      
//       final jsonBody = response.data["product"];
//       if (jsonBody is List) {
//         return jsonBody.map((json) => ContentModel.fromJson(json)).toList();
//       }
//     }
//     return null;
//   }
// }

