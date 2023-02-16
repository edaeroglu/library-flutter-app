import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/feature/home/view/home_view.dart';

import 'package:mobile_app/product/textformfield/text_form_field.dart';

class BestSellerView extends StatefulWidget {
  const BestSellerView({super.key});

  @override
  State<BestSellerView> createState() => _BestSellerViewState();
}

class _BestSellerViewState extends State<BestSellerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 92.h,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff090937)),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeView()));
            },
            child: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
                child: Text(
              'Best Seller',
              style: GoogleFonts.manrope(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff090937)),
            )),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            SearchBox().searchBoxDesign,
            Row(
              children: [
                SizedBox(
                  width: 170.w,
                  height: 284.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/dune.png',
                          width: 150.w,
                          height: 225.h,
                        ),
                      ),
                      Text('Dune'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text('Frank Herbert'), Text('87,75')],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 170.w,
                  height: 284.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('assets/images/dune.png'),
                      ),
                      Text('Dune'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text('Frank Herbert'), Text('87,75')],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
