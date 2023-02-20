import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/feature/home/view/home_view.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<RegisterModel> _submitRegisterForm() async {
    final url = '/register';
    final formData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    try {
      final response = await Dio().post(url, data: formData);
      return RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response?.data ?? e.message);
      throw e;
    }
  }

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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final registerModel = await _submitRegisterForm();
                        // TODO: Handle the response
                        print(registerModel);
                      }
                    },
                    child: Text(
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
      );
    }));
  }
}

class RegisterModel {
  String? code;
  String? error;
  String? path;

  RegisterModel({this.code, this.error, this.path});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    error = json['error'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['error'] = this.error;
    data['path'] = this.path;
    return data;
  }
}
