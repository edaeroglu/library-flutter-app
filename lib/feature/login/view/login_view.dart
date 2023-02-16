import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/feature/home/view/home_view.dart';
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
                          style: GeneralTextStyle.generalTextStyle),
                       Text('Login To Your Account',
                          style: GeneralTextStyle.generalTextStyle),
                      SizedBox(height: 80.h),
                       Text(
                        'E-mail',
                        style: GeneralTextStyle.generalTextStyle,
                      ),
                      MailBox().mailBoxDesign,
                      SizedBox(height: 24.h),
                       Text(
                        'Password',
                        style: GeneralTextStyle.generalTextStyle,
                      ),
                      PasswordBox().passwordBoxDesign,
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              value: false,
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              onChanged: (value) {},
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
                      GeneralButton(
                        onPressed: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeView()));
                        },
                        buttonText: 'Login',
                      )
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
