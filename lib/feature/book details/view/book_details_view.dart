import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/product/components/buttons/general_button.dart';
import '../../../product/model/contents_model.dart';
import '../../best seller/view/best_seller.dart';

// abstract class BookDetailsViewModel extends State<BookDetailsView>
//     with ProjectDioMixin {
//   late final ICategoryService categoryService;

//   List<ContentModel> contentList = [];
//   bool isLoading = false;

//   void changeLoading() {
//     setState(() {
//       isLoading = !isLoading;
//     });
//   }

//   @override
//   Future<void> initState() async {
//     super.initState();
//     // await initCategoryService();
//     // getListContent();
//   }

//   Future<void> initCategoryService() async {
//     categoryService = CategoryService(service);
//   }

//   Future<void> getListContent(int index) async {
//     changeLoading();
//     contentList = await categoryService.getContents(index) ?? [];
//     changeLoading();
//   }
// }

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.contentList});
  final List<ContentModel> contentList;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  late final List<ContentModel> contentList;
  
 
  @override
  void initState() {
    contentList = widget.contentList;

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BestSellerView(
                            contentList: [],
                          )));
            },
            child: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
                child: Text(
              'Book Details',
              style: GoogleFonts.manrope(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff090937)),
            )),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.w),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "",
                      width: 150.w,
                      height: 225.h,
                      fit: BoxFit.cover,
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Color(0xff6251DD),
                    ),
                  ],
                ),
                Text(
                  "",
                  style: GoogleFonts.manrope(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff090937),
                  ),
                ),
                Text(
                  "Frank Herbert",
                  style: GoogleFonts.manrope(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff090937).withOpacity(0.6),
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 35.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Summary',
                      style: GoogleFonts.manrope(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff090937),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      "Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis. While the planet is an inhospitable and sparsely populated desert wasteland, it is the only source of melange, or spice, a drug that...",
                      maxLines: 8,
                      style: GoogleFonts.manrope(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff090937).withOpacity(0.6),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            GeneralButton(
                onPressed: () {}, buttonText: '87.75', secondText: 'Buy Now'),
          ],
        ),
      ),
    );
  }
}
