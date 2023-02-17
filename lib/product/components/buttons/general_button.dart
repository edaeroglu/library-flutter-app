import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/product/text_style/text_style.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({super.key, this.onPressed, required this.buttonText, this.secondText});
  final void Function()? onPressed;
  final String buttonText;
  final String? secondText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 60.h),
          backgroundColor: const Color(0xFFEF6B4A)),
      child: secondText == null ? Text(
        buttonText ?? '',
        style: GeneralTextStyle.generalButtonTextStyle,
      ) : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(buttonText),
          Text(secondText!)
        ],
      ),
      
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