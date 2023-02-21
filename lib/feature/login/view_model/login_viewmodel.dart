import 'package:flutter/material.dart';
import 'package:mobile_app/feature/home/view/home_view.dart';
import 'package:mobile_app/feature/login/service/login_service.dart';
import 'package:mobile_app/feature/login/view/login_view.dart';
import 'package:mobile_app/product/service/project_dio.dart';

abstract class LoginViewModel extends State<LoginView> with ProjectDioMixin {
  String? token;

  late final ILoginService loginService;

  LoginViewModel() {
    loginService = LoginService(service);
  }

  Future<void> loginButton(String email, String password) async {
    token = await loginService.login(email, password);
  }
}
