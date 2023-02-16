import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/feature/login/view/login_view.dart';
import 'package:mobile_app/product/components/buttons/general_button.dart';

import '../../../product/text_style/text_style.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1D4E),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Center(child: SvgPicture.asset('assets/images/logo.svg'))),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GeneralButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                    },buttonText: 'Login',),
                    
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Skip',
                        style: GeneralTextStyle.generalButtonTextStyle,
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
