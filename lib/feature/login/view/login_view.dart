import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/feature/register/view/register_view.dart';
import 'package:mobile_app/product/components/buttons/general_button.dart';
import 'package:mobile_app/product/padding/padding.dart';
import 'package:mobile_app/product/text_style/text_style.dart';
import 'package:mobile_app/product/textformfield/text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late Dio _dio;

  @override
  void initState() {
    super.initState();
    _dio = Dio(); // Dio nesnesi oluşturuyoruz
  }

  Future<String?> _login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      final data = response.data;

      if (data != null && data['token'] != null) {
        return data['token'];
      } else {
        return null;
      }
    } on DioError catch (e) {
      // Hata durumlarında mesaj göstermek için hata nesnesini kullanabiliriz.
      final errorMessage = e.response?.data['message'] ?? 'Bir hata oluştu.';
      print(errorMessage);
      return null;
    }
  }

  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: LoginViewPadding().loginViewPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 100,
                          height: 65,
                          child: SvgPicture.asset('assets/images/logo.svg'),
                        ),
                      ),
                      SizedBox(height: 115.h),
                      Text('Welcome Back!',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff090937).withOpacity(0.6))),
                      Text('Login To Your Account',
                          style: GeneralTextStyle.AccountTextStyle),
                      SizedBox(height: 80.h),
                      Text(
                        'E-mail',
                        style: GeneralTextStyle.generalTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF4F4FF),
                            hintText: 'john@mail.com',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      //MailBox().mailBoxDesign,
                      SizedBox(height: 24.h),
                      Text(
                        'Password',
                        style: GeneralTextStyle.generalTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF4F4FF),
                            hintText: '**********',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      //PasswordBox().passwordBoxDesign,
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              value: _isSelected,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  _isSelected = newValue!;
                                });
                              },
                              title: const Text('Remember Me'),
                            ),
                          ),
                          TextButtonStyle(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView()));
                            },
                            buttonText: 'Register',
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox(height: 10.h)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 60.h),
                            backgroundColor: const Color(0xFFEF6B4A)),
                        onPressed: () async {
                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();

                          final token = await _login(email, password);

                          if (token != null) {
                            // Giriş başarılı, token kaydedilir ve yeni sayfaya yönlendirilir.
                          } else {
                            // Hata durumunda kullanıcıya mesaj gösterilir.
                          }
                        },
                        child: Text(
                          'Login',
                          style: GeneralTextStyle.generalButtonTextStyle,
                        ),
                      ),
                      // GeneralButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     const HomeView()));
                      //   },
                      //   buttonText: 'Login'
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
