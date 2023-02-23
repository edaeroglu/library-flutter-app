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

  static final writerTextStyle = GoogleFonts.manrope(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xff090937),
  );

  static final bookTextStyle = GoogleFonts.manrope(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xff090937).withOpacity(0.6),
  );
  static final categoryTextStyle = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xff090937),
  );

  static final priceTextStyle = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xff6251DD),
  );

  static final priceBSTextStyle = GoogleFonts.manrope(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xff6251DD),
  );

  static final accountTextStyle = GoogleFonts.manrope(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xff090937),
  );
}
