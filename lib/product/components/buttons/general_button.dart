import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/product/text_style/text_style.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({super.key, this.onPressed, this.buttonText});
  final void Function()? onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      child: Text(
        buttonText ?? '',
        style: GeneralTextStyle.generalButtonTextStyle,
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 60.h),
          backgroundColor: Color(0xFFEF6B4A)),
    );
  }
}

class TextButtonStyle extends StatelessWidget {
  const TextButtonStyle({super.key, this.onPressed, this.buttonText});
  final void Function()? onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      child:
          Text(buttonText ?? '', style: GeneralTextStyle.textButtonTextStyle),
    );
  }
}

// class ElevatedButtonCategory extends StatelessWidget {
//   const ElevatedButtonCategory({super.key, this.onPressed, this.buttonText});
//   final void Function()? onPressed;
//   final String? buttonText;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed ?? () {},
//                         child: Text(buttonText ?? ''),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xff6251DD),
//                         )
//     );
//   }
// }