// import 'package:flutter/material.dart';
// import '../model/login_model.dart';
// import '../service/login_service.dart';


// class LoginViewModel extends ChangeNotifier {
//   final LoginService _loginService = LoginService();

//   LoginModel? _loginModel;
//   bool _isLoading = false;
//   String _errorMessage = '';

//   LoginModel? get loginModel => _loginModel;
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;

//   Future<void> login(String email, String password) async {
//     _isLoading = true;
//     _errorMessage = '';
//     notifyListeners();

//     try {
//       _loginModel = await _loginService.login(email, password);
//     } catch (error) {
//       _errorMessage = error.toString();
//     }

//     _isLoading = false;
//     notifyListeners();
//   }
// }
// class LoginViewModel extends ChangeNotifier {
//   final service = LoginService();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();

 
// }
