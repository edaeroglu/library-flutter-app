import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:mobile_app/product/text_style/text_style.dart';

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class NameBox {
  final nameBoxDesign = TextFormField(
    obscureText: true,
    decoration: const InputDecoration(
        filled: true,
        fillColor: Color(0xFFF4F4FF),
        border: InputBorder.none,
        hintText: 'John Doe'),
  );
}

class MailBox {
  final mailBoxDesign = TextFormField(
    controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    decoration: const InputDecoration(
      filled: true,
      fillColor: Color(0xFFF4F4FF),
      hintText: 'john@mail.com',
      border: InputBorder.none,
    ),
  );
}

class PasswordBox {
  final passwordBoxDesign = TextFormField(
    obscureText: true,
    controller: _passwordController,
    keyboardType: TextInputType.visiblePassword,
    decoration: const InputDecoration(
      filled: true,
      fillColor: Color(0xFFF4F4FF),
      hintText: '**********',
      border: InputBorder.none,
    ),
  );
}

class SearchBox {
  final searchBoxDesign = Padding(
    padding: const EdgeInsets.only(top: 20),
    child: TextFormField(
      style: GeneralTextStyle.categoryTextStyle,
      obscureText: true,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color(0xFFF4F4FF),
        border: InputBorder.none,
        hintText: 'Search',
        suffixIcon: Icon(Icons.tune),
        prefixIcon: Icon(Icons.search),
      ),
    ),
  );
}

class LoginRegisterSizedBox extends StatelessWidget {
  const LoginRegisterSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 65,
      child: SvgPicture.asset('assets/images/logo.svg'),
    );
  }
}
