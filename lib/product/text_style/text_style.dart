import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralTextStyle {
  static final generalTextStyle = GoogleFonts.manrope(
    fontWeight: FontWeight.w600,
    color: Color(0xff090937),
  );

  static final generalButtonTextStyle = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static final textButtonTextStyle = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    color: Color(0xff6251DD),
  );

  static final WriterTextStyle = GoogleFonts.manrope(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xff090937),
  );

  static final BookTextStyle = GoogleFonts.manrope(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xff090937).withOpacity(0.6),
  );
  static final CategoryTextStyle = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xff090937),
  );

  static final PriceTextStyle = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xff6251DD),
  );

  static final PriceBSTextStyle = GoogleFonts.manrope(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xff6251DD),
  );

  static final AccountTextStyle = GoogleFonts.manrope(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xff090937),
  );
}
