import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/feature/home/view/home_view.dart';
import 'package:mobile_app/feature/login/view/login_view.dart';
import 'package:mobile_app/product/components/buttons/general_button.dart';
import 'package:mobile_app/product/padding/padding.dart';
import '../../../product/text_style/text_style.dart';
import '../view_model/register_viewmodel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends RegisterViewModel {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isRegistering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: LoginViewPadding().loginViewPadding,
              child: Form(
                key: _formKey,
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
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff090937).withOpacity(0.6))),
                        Text('Register an Account',
                            style: GeneralTextStyle.AccountTextStyle),
                        SizedBox(height: 80.h),
                        Text(
                          'Name',
                          style: GeneralTextStyle.generalTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF4F4FF),
                              hintText: 'John Doe',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        //MailBox().mailBoxDesign,
                        SizedBox(height: 24.h),
                        Text(
                          'E-mail',
                          style: GeneralTextStyle.generalTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF4F4FF),
                              hintText: 'john@mail.com',
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        //MailBox().mailBoxDesign,
                        SizedBox(height: 24.h),
                        Text(
                          'Password',
                          style: GeneralTextStyle.generalTextStyle,
                        ),
                        //PasswordBox().passwordBoxDesign,
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF4F4FF),
                              hintText: '**********',
                              border: InputBorder.none,
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButtonStyle(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeView())); //burası LoginView olarak değişecek
                            },
                            buttonText: 'Login',
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 60.h),
                          backgroundColor: const Color(0xFFEF6B4A)),
                      onPressed: _isRegistering ? null : _register,
                      child: _isRegistering
                          ? CircularProgressIndicator()
                          : Text(
                              'Register',
                              style: GeneralTextStyle.generalButtonTextStyle,
                            ),
                    ),
                    // GeneralButton(
                    //   onPressed: () {},
                    //   buttonText: 'Register',
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isRegistering = true;
      });

      final success = await register(_emailController.text,
          _nameController.text, _passwordController.text);

      setState(() {
        _isRegistering = false;
      });

      if (success) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginView()));
      } else {
        // ignore: use_build_context_synchronously
        await showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Error"),
            contentPadding: EdgeInsets.all(20),
          ),
        );
      }
    }
  }
}
