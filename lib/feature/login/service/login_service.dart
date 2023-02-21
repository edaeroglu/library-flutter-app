import 'package:dio/dio.dart';


abstract class ILoginService {
  ILoginService(this.dio);
  final Dio dio;

  Future<String?> login(String email, String password);
}

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<String?> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      final data = response.data;

      if (data != null && data["action_login"]["token"] != null  ) {
        return data["action_login"]["token"];
      } else {
        return null;
      }

      // if (data == null && data['token'] == null ) {
      //   return null;
      // } else {
      //   return data['token'];
      // }

    } on DioError catch (e) {
      // Hata durumlarında mesaj göstermek için hata nesnesini kullanabiliriz.
      final errorMessage = e.response?.data['message'] ?? 'Bir hata oluştu.';
      print(errorMessage);
      return null;
    }
  }
}
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
