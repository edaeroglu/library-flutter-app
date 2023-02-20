// import 'package:dio/dio.dart';
// import '../model/login_model.dart';

// class LoginService {
//   static const _baseUrl = 'https://assign-api.piton.com.tr/api/rest';

//   final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

//   Future<LoginModel> login(String email, String password) async {
//     try {
//       final response = await _dio.post('/login', data: {
//         'email': email,
//         'password': password,
//       });
//       if (response.statusCode == 200) {
//         return LoginModel.fromJson(response.data);
//       } else {
//         throw Exception('Failed to login');
//       }
//     } catch (error) {
//       throw Exception('Failed to login: $error');
//     }
//   }
// }
// class LoginService {
//   final String baseUrl = 'https://assign-api.piton.com.tr/api/rest';
//   final dio = Dio();
//   Future<LoginModel?> loginCall(
//       {required String email, required String password}) async {
//     Map<String, dynamic> json = {"email": email, "password": password};
//     var response = await dio.post(baseUrl + "/login", data: json);
//     if (response.statusCode == 200) {
//       var result = LoginModel.fromJson(response.data);
//       return result;
//     } else {
//       throw ("Bir sorun oluştu ${response.statusCode}");
//     }
//   }
// }
