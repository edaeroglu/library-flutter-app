import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/feature/home/view_model/home_viewmodel.dart';
import 'package:mobile_app/product/textformfield/text_form_field.dart';
import '../widget/category_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 92.h,
        backgroundColor: Colors.white,
        leadingWidth: 70.w,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            width: 50.w,
            height: 32.h,
            child: SvgPicture.asset('assets/images/logo.svg'),
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
                child: Text(
              'Catalog',
              style: GoogleFonts.manrope(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff090937)),
            )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? CircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 42.h,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: categoryList.length,
                        //itemExtent: 70.0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            categoryList[index].name ?? "",
                            style: TextStyle(color: Colors.black),
                          );
                          // return Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     ElevatedButton(
                          //         onPressed: () {},
                          //         // ignore: sort_child_properties_last
                          //         child: Text(
                          //           'All',
                          //           style: GeneralTextStyle.CategoryTextStyle,
                          //         ),
                          //         style: ElevatedButton.styleFrom(
                          //             backgroundColor: Color(0xff6251DD),
                          //             elevation: 0)),
                          //     SizedBox(
                          //       width: 10.w,
                          //     ),
                          //     ElevatedButton(
                          //         onPressed: () {},
                          //         child: Text(
                          //           'Classics',
                          //           style: GeneralTextStyle.CategoryTextStyle,
                          //         ),
                          //         style: ElevatedButton.styleFrom(
                          //             backgroundColor: Color(0xffF4F4FF),
                          //             elevation: 0)),
                          //     SizedBox(
                          //       width: 10.w,
                          //     ),
                          //     ElevatedButton(
                          //         onPressed: () {},
                          //         child: Text(
                          //           'Horror',
                          //           style: GeneralTextStyle.CategoryTextStyle,
                          //         ),
                          //         style: ElevatedButton.styleFrom(
                          //             backgroundColor: Color(0xffF4F4FF),
                          //             elevation: 0)),
                          //     SizedBox(
                          //       width: 10.w,
                          //     ),
                          //     ElevatedButton(
                          //         onPressed: () {},
                          //         child: Text(
                          //           'Romance',
                          //           style: GeneralTextStyle.CategoryTextStyle,
                          //         ),
                          //         style: ElevatedButton.styleFrom(
                          //             backgroundColor: Color(0xffF4F4FF),
                          //             elevation: 0)),
                          //     SizedBox(
                          //       width: 10.w,
                          //     ),
                          //     ElevatedButton(
                          //         onPressed: () {},
                          //         child: Text(
                          //           'Children',
                          //           style: GeneralTextStyle.CategoryTextStyle,
                          //         ),
                          //         style: ElevatedButton.styleFrom(
                          //             backgroundColor: Color(0xffF4F4FF),
                          //             elevation: 0)),
                          //   ],
                          // );
                        },
                      ),
                    ),
                    SearchBox().searchBoxDesign,
                    const BestSellerWidget(),
                    const ClassicsWidget(),
                    const ChildrenWidget()
                  ],
                ),
              ),
      ),
    );
  }
}






// class CategoryRow {
//   final categoryRow = Padding(
//     padding:  EdgeInsets.only(right: 10.h),
//     child: Row(
//       children: [
//         ElevatedButton(
//             onPressed: () {},
//             child: Text('All'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xff6251DD),
//             )),
//         ElevatedButton(
//             onPressed: () {},
//             child: Text('All'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xff6251DD),
//             )),
//       ],
//     ),
//   );
// }

