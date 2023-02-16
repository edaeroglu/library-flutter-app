import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/product/components/buttons/general_button.dart';
import 'package:mobile_app/product/padding/padding.dart';
import 'package:mobile_app/product/textformfield/text_form_field.dart';
import '../../../product/text_style/text_style.dart';
import '../../login/view/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: LoginViewPadding().loginViewPadding,
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 65,
                    child: SvgPicture.asset('assets/images/logo.svg'),
                  ),
                  SizedBox(height: 115.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('Welcome',
                          style: GeneralTextStyle.generalTextStyle),
                       Text('Register an Account',
                          style: GeneralTextStyle.generalTextStyle),
                      SizedBox(height: 80.h),
                       Text(
                        'Name',
                        style: GeneralTextStyle.generalTextStyle,
                      ),
                      MailBox().mailBoxDesign,
                      SizedBox(height: 24.h),
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButtonStyle(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()));
                          },
                          buttonText: 'Login',
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  GeneralButton(
                    onPressed: () {},
                    buttonText: 'Register',
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
