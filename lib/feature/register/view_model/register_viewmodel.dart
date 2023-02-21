import 'package:flutter/material.dart';
import 'package:mobile_app/feature/register/view/register_view.dart';
import 'package:mobile_app/product/service/project_dio.dart';

import '../service/register_service.dart';



abstract class RegisterViewModel extends State<RegisterView> with ProjectDioMixin {
  final RegisterService registerService = RegisterService();

  Future<bool> register(String email, String name, String password) async {
    return await registerService.register(email, name, password);
  }

  
}


