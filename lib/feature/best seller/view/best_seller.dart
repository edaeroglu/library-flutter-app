import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/feature/home/view/home_view.dart';
import 'package:mobile_app/feature/home/view_model/home_viewmodel.dart';
import 'package:mobile_app/product/text_style/text_style.dart';
import 'package:mobile_app/product/textformfield/text_form_field.dart';
import '../../../product/model/contents_model.dart';
import '../../../product/service/project_dio.dart';
import '../../book details/view/book_details_view.dart';
import '../../home/service/category_service.dart';

abstract class BestSellerViewModel extends State<BestSellerView>
    with ProjectDioMixin {
  late final ICategoryService categoryService;

  List<ContentModel> contentList = [];
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    initCategoryService();
    // getListContent();
  }

  Future<void> initCategoryService() async {
    categoryService = CategoryService(service);
  }

  Future<void> getListContent(int index) async {
    changeLoading();
    contentList = await categoryService.getContents(index) ?? [];
    changeLoading();
  }
}

class BestSellerView extends StatefulWidget {
  BestSellerView({super.key});

  @override
  State<BestSellerView> createState() => _BestSellerViewState();
}

class _BestSellerViewState extends BestSellerViewModel {
  List<ContentModel> contentList = [];
  late final HomeViewModel homeViewModel;

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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: contentList.length, //widget.contentList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDetailsView(
                                    homeViewModel: contentList[index]
                                  )));
                        },
                        child: Card(
                          elevation: 0,
                          color: const Color(0xffF4F4FF),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/dune.png',
                                width: 150.w,
                                height: 225.h,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                contentList?[index].name ?? "",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.manrope(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff090937)),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                contentList?[index].author ??
                                                    "",
                                                style: GoogleFonts.manrope(
                                                    fontSize: 8.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff090937)
                                                        .withOpacity(0.6)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            contentList?[index]
                                                    .price
                                                    .toString() ??
                                                "",
                                            style: GeneralTextStyle
                                                .PriceBSTextStyle,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              // child: GridView.builder(
              //   crossAxisSpacing: 10,
              //   mainAxisSpacing: 10,
              //   crossAxisCount: 2,
              //   childAspectRatio: 0.6,

              //   children: [

              //     GridCardWidget(

              //       contentList: contentList,
              //     ),
              //     GridCardWidget(),
              //     GridCardWidget(),
              //     GridCardWidget(),
              //     GridCardWidget(),
              //     GridCardWidget(),
              //     GridCardWidget(),
              //   ],
              // ),
            )
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 170.w,
            //       height: 284.h,
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(10),
            //             child: Image.asset(
            //               'assets/images/dune.png',
            //               width: 150.w,
            //               height: 225.h,
            //             ),
            //           ),
            //           Text('Dune'),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [Text('Frank Herbert'), Text('87,75')],
            //           )
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       width: 170.w,
            //       height: 284.h,
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(10),
            //             child: Image.asset('assets/images/dune.png'),
            //           ),
            //           Text('Dune'),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [Text('Frank Herbert'), Text('87,75')],
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
