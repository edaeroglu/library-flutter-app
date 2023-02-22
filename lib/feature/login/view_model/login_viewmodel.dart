import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_app/feature/login/service/login_service.dart';
import 'package:mobile_app/feature/login/view/login_view.dart';
import 'package:mobile_app/product/service/project_dio.dart';

// String getJsonFromJWT(token) {
//   String normalizedSource = base64Url.normalize(token);
//   return utf8.decode(base64Url.decode(normalizedSource));
// }

abstract class LoginViewModel extends State<LoginView> with ProjectDioMixin {
  String? token;
  // String? getJwt;

  

  late final ILoginService loginService;

  LoginViewModel() {
    loginService = LoginService(service);
  }

  Future<void> loginButton(String email, String password) async {
    token = await loginService.login(email, password);
    // getJwt = getJsonFromJWT(token);
    // print(getJwt);

    // String jwt = token!;
    // List<String> parts = jwt.split('.');
    // String payload = parts[1];
    // String normalized = base64Url.normalize(payload);
    // String utf8Payload = utf8.decode(base64Url.decode(normalized));


    // void parseToken(String token) {
    // Map<String, dynamic> payloadMap = jsonDecode(utf8Payload);
    // String jsonPayload = jsonEncode(payloadMap);

  }


  }

