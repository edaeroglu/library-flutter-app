import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/feature/login/view_model/login_viewmodel.dart';
import 'package:mobile_app/feature/register/view/register_view.dart';
import 'package:mobile_app/product/components/buttons/general_button.dart';
import 'package:mobile_app/product/padding/padding.dart';
import 'package:mobile_app/product/text_style/text_style.dart';
import '../../../product/textformfield/text_form_field.dart';
import '../../home/view/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.token});
  final String token;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                      const Align(
                        alignment: Alignment.center,
                        child: LoginRegisterSizedBox(),
                      ),
                      SizedBox(height: 115.h),
                      Text('Welcome Back!',
                          style: GeneralTextStyle.generalButtonTextStyle
                              .copyWith(
                                  color: Color(0xff090937).withOpacity(0.6))),
                      Text('Login To Your Account',
                          style: GeneralTextStyle.accountTextStyle),
                      SizedBox(height: 80.h),
                      Text(
                        'E-mail',
                        style: GeneralTextStyle.generalTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: MailBox().mailBoxDesign,
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Password',
                        style: GeneralTextStyle.generalTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: PasswordBox().passwordBoxDesign,
                      ),
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
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeView(token: token!)),
                                (route) => route.isFirst);
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
