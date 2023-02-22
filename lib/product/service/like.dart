import 'package:dio/dio.dart';

Future<void> makePostRequest(String token) async {
  final url = 'https://assign-api.piton.com.tr/api/rest/like';
  final headers = {'Authorization': 'Bearer $token'};

  try {
    final data = {'name': 'John Doe', 'email': 'johndoe@example.com'};
    final response =
        await Dio().post(url, data: data, options: Options(headers: headers));

    if (response.statusCode == 200) {
      final responseBody = response.data;
    } else {
      final errorMessage = response.statusMessage;
    }
  } catch (error) {
    final errorMessage = error.toString();
  }
}
