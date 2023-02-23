import 'package:flutter/material.dart';
import 'package:mobile_app/feature/login/service/login_service.dart';
import 'package:mobile_app/feature/login/view/login_view.dart';
import 'package:mobile_app/product/service/project_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum EnumValue { token }

abstract class LoginViewModel extends State<LoginView> with ProjectDioMixin {
  String? token;
  bool rememberMe = false;

  late final ILoginService loginService;

  LoginViewModel() {
    loginService = LoginService(service);
  }

  Future<void> loginButton(String email, String password) async {
    token = await loginService.login(email, password);

    rememberMe ? await saveToken(token ?? "") : null;
  }

  Future<void> saveToken(String myToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(EnumValue.token.name, myToken);

   
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
