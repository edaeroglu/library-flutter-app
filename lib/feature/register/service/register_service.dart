import 'package:dio/dio.dart';
import 'package:mobile_app/product/service/project_dio.dart';

class RegisterService with ProjectDioMixin {
  Future<bool> register(String email, String name, String password) async {
    try {
      final response = await service.post('/register', data: {
        'email': email,
        'name': name,
        'password': password,
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
































// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../view/register_view.dart';

// abstract class IRegisterService {
//   IRegisterService(this.dio);
//   final Dio dio;

//   Future<String?> register(String name, String email, String password);
// }

// class RegisterService extends IRegisterService {
//   RegisterService(Dio dio) : super(dio);

  

//   @override
//   Future<RegisterModel> register(
//       String name, String email, String password) async {
//      final response = await dio.post( '/register',
//      data : {
//       'name': _nameController.text,
//       'email': _emailController.text,
//       'password': _passwordController.text,
//     },);
//       final data = response.data;

//     try {
//       final response = await Dio().post(url, data: data);
//       return RegisterModel.fromJson(response.data);
//     } on DioError catch (e) {
//       print(e.response?.data ?? e.message);
//       throw e;
//     }
//   }
// }
