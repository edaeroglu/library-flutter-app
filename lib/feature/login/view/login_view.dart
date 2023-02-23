import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/feature/login/view_model/login_viewmodel.dart';
import 'package:mobile_app/feature/register/view/register_view.dart';
import 'package:mobile_app/product/components/buttons/general_button.dart';
import 'package:mobile_app/product/padding/padding.dart';
import 'package:mobile_app/product/text_style/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/view/home_view.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key, required this.token});
  final String token;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

//   Future<void> main() async {
//   // SharedPreferences'a erişin
//   SharedPreferences prefs = await SharedPreferences.getInstance();

//   // "token" anahtarından token'ı alın
//   token = prefs.getString('token');

//   // 5 saniye bekleyin
//   await Future.delayed(Duration(seconds: 5));

//   // Token kontrolü yapın
//   if (token != null) {
//     // Token varsa anasayfaya yönlendirin
//     runApp(HomeView(token: widget.token,));
//   } else {
//     // Token yoksa giriş sayfasına yönlendirin
//     runApp(LoginPage());
//   }
// }

  @override
  void initState() {
    super.initState();
  }

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
                          obscureText: true,
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
                              value: rememberMe,
                              onChanged: (newValue) {
                                setState(() {
                                  rememberMe = newValue!;
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
                          await loginButton(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );

                          if (token!.isEmpty || token == null) {
                            // ignore: use_build_context_synchronously
                            await showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text("Error"),
                                contentPadding: EdgeInsets.all(20),
                              ),
                            );

                            // Kullanıcıya geri bildirim verilecek
                          } else {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeView(token: token!)),
                                (route) => route.isFirst);

                            //login oldu sayfaya yönlendir
                          }
                        },
                        child: Text(
                          'Login',
                          style: GeneralTextStyle.generalButtonTextStyle,
                        ),
                      ),
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




 // void _getSavedLoginInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _rememberMe = prefs.getBool('rememberMe') ?? false;
  //     if (_rememberMe) {
  //       _emailController.text = prefs.getString('email') ?? '';
  //       _passwordController.text = prefs.getString('password') ?? '';
  //     }
  //   });
  // }

  // void _saveLoginInfo() async {
  //   final expireDate = DateTime.fromMillisecondsSinceEpoch(123461253456124);
  //   final now = DateTime.now();

  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (now.compareTo(expireDate) == 1) {
  //     prefs.remove('email');
  //     prefs.remove('password');
  //   } else {
  //     prefs.setString('email', _emailController.text);
  //     prefs.setString('password', _passwordController.text);
  //   }

  //   prefs.setBool('rememberMe', _rememberMe);
  // }