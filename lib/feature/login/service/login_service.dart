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

      print(response);

      final data = response.data;

      if (data != null && data["action_login"]["token"] != null) {
        return data["action_login"]["token"];
      } else {
        return "Hata";
      }
    } on DioError catch (e) {
      // Hata durumlarında mesaj göstermek için hata nesnesini kullanabiliriz.
      final errorMessage = e.response?.data['message'] ?? 'Bir hata oluştu.';
      print(errorMessage);
      return null;
    }
  }
}
