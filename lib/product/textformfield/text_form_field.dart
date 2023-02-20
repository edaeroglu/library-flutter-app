import 'package:flutter/material.dart';

import 'package:mobile_app/product/text_style/text_style.dart';

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
    decoration: const InputDecoration(
      filled: true,
      fillColor: Color(0xFFF4F4FF),
      border: InputBorder.none,
    ),
  );
}

class SearchBox {
  final searchBoxDesign = Padding(
    padding: const EdgeInsets.only(top: 20),
    child: TextFormField(
      style: GeneralTextStyle.CategoryTextStyle,
      obscureText: true,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color(0xFFF4F4FF),
        border: InputBorder.none,
        hintText: 'Search',
        suffixIcon: Icon(Icons.tune),
        prefixIcon: Icon(Icons.search),
        //icon: Icon(Icons.tune ,textDirection: TextDirection.rtl),
      ),
    ),
  );
}
