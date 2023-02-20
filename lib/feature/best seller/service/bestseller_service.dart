// Future<List<BestSellerViewModel>> getProductImage({required String cover}) async {
//     final response = await dio.post('cover_image', data: {'fileName': cover});
//     if (response.statusCode == 200) {
//       final jsonBody = response.data["url"];
//       if (jsonBody is String) {
//         final List<dynamic> parsedJson = json.decode(jsonBody);
//         return parsedJson
//             .map((json) => BestSellerViewModel.fromJson(json))
//             .toList();
//       }
//     }
//     return [];
//   }