import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/feature/best%20seller/view/best_seller.dart';
import 'package:mobile_app/feature/home/view_model/home_viewmodel.dart';
import 'package:mobile_app/product/textformfield/text_form_field.dart';

import '../../../product/model/contents_model.dart';
import '../../../product/text_style/text_style.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  List<ContentModel> contentList = [];

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
        body: FutureBuilder(
          future: getList(),
          builder: (context, snapshot) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {},

                        // ignore: sort_child_properties_last
                        child: Text(
                          "All",
                          style: GeneralTextStyle.CategoryTextStyle,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff6251DD), elevation: 0)),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF4F4FF), elevation: 0),
                        child: Text(
                          'Classics',
                          style: GeneralTextStyle.CategoryTextStyle,
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF4F4FF), elevation: 0),
                        child: Text(
                          'Horror',
                          style: GeneralTextStyle.CategoryTextStyle,
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF4F4FF), elevation: 0),
                        child: Text(
                          'Romance',
                          style: GeneralTextStyle.CategoryTextStyle,
                        )),
                    // ElevatedButton(
                    //     onPressed: () {},
                    //     style: ElevatedButton.styleFrom(
                    //         backgroundColor: Color(0xffF4F4FF), elevation: 0),
                    //     child: Text(
                    //       'Children',
                    //       style: GeneralTextStyle.CategoryTextStyle,
                    //     )),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
              ),
              SearchBox().searchBoxDesign,
              Expanded(
                child: ListView.builder(
                    itemCount: categoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  categoryList[index].name ?? "",
                                  style: GoogleFonts.manrope(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff090937),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BestSellerView(
                                                    contentList:allContents[index],
                                                  )));
                                    },
                                    child: const Text(
                                      'View All',
                                      style:
                                          TextStyle(color: Color(0xffEF6B4A)),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 140.h,
                            width: double.infinity,
                            child: ListView.builder(
                                // itemCount: contentList.length,
                                itemCount: allContents[index].length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (BuildContext context, int index2) {
                                  return Card(
                                    elevation: 0,
                                    color: Color(0xffF4F4FF),
                                    child: Row(
                                      children: [
                                        Image.network(
                                            allContents[index][index2].cover ??
                                                ""),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10.h, bottom: 4.h),
                                              child: Text(
                                                allContents[index][index2]
                                                        .name ??
                                                    "",
                                                style: GeneralTextStyle
                                                    .WriterTextStyle,
                                              ),
                                            ),
                                            Text(
                                              allContents[index][index2]
                                                      .author ??
                                                  "",
                                              style: GeneralTextStyle
                                                  .BookTextStyle,
                                            ),
                                            SizedBox(
                                              height: 45.h,
                                            ),
                                            Text(
                                              allContents[index][index2]
                                                      .price
                                                      .toString() ??
                                                  "",
                                              style: GeneralTextStyle
                                                  .PriceTextStyle,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      );
                    }),
              ),
            ]),
          ),
        ));
  }
}

//SingleChildScrollView(
      //   child: isLoading
      //       ? Center(child: CircularProgressIndicator())
      //       : Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 20.w),
      //           child: Column(
      //             children: [
      //               SizedBox(
      //                 height: 42.h,
      //                 width: double.infinity,
      //                 child: ListView.builder(
      //                   itemCount: categoryList.length,
      //                   //itemExtent: 70.0,
      //                   scrollDirection: Axis.horizontal,
      //                   itemBuilder: (BuildContext context, int index) {
      //                     return Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: [
      //                         ElevatedButton(
      //                             onPressed: () {},
      //                             // ignore: sort_child_properties_last
      //                             child: Text(
      //                               categoryList[index].name ?? "",
      //                               style: TextStyle(color: Colors.black),
      //                             ),
      //                             style: ElevatedButton.styleFrom(
      //                                 backgroundColor: Color(0xff6251DD),
      //                                 elevation: 0)),
      //                         SizedBox(
      //                           width: 10.w,
      //                         ),
      //                         // ElevatedButton(
      //                         //     onPressed: () {},
      //                         //     style: ElevatedButton.styleFrom(
      //                         //         backgroundColor: Color(0xffF4F4FF),
      //                         //         elevation: 0),
      //                         //     child: Text(
      //                         //       'Classics',
      //                         //       style: GeneralTextStyle.CategoryTextStyle,
      //                         //     )),
      //                         // SizedBox(
      //                         //   width: 10.w,
      //                         // ),
      //                         //
      //                       ],
      //                     );
      //                   },
      //                 ),
      //               ),
      //               SearchBox().searchBoxDesign,
      //               BestSellerWidgets(
      //                 contentList: contentList,
      //               ),
      //               const ClassicsWidget(),
      //               const ChildrenWidget()
      //             ],
      //           ),
      //         ),
      // ),
//-------------------------------------------------
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
// Column(children: [
//         Expanded(
//           child: ListView.builder(
//               itemCount: categoryList.length,
//               //itemExtent: 70.0,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (BuildContext context, int index) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       // ignore: sort_child_properties_last
//                       child: Text(
//                         categoryList[index].name ?? "",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 );
//               }),
//         )
//       ]),