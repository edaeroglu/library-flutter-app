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
  const BookDetailsView({super.key, required this.content});
  final ContentModel content;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  late final ContentModel content;
  bool isChange = false;
  @override
  void initState() {
    content = widget.content;

    super.initState();
  }

  Color _iconColor = Colors.blue;
  Icon defaultIcon = Icon(Icons.favorite_border);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 92.h,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff090937)),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
                child: Text(
              'Book Details',
              maxLines: 8,
              style: GoogleFonts.manrope(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff090937),
              ),
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
                      content.cover ?? "",
                      width: 150.w,
                      height: 225.h,
                      fit: BoxFit.cover,
                    ),
                    IconButton(
                      icon: defaultIcon,
                      color: _iconColor,
                      onPressed: () {
                        setState(() {
                          _iconColor = _iconColor == Color(0xff6251DD)
                              ? Colors.green
                              : Color(0xff6251DD); // renk değiştirme işlemi
                          defaultIcon =
                              defaultIcon == Icon(Icons.favorite_border)
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border);
                        });
                      },
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       isChange = !isChange;
                    //     });

                    //   },

                    //     icon: Icon(
                    //       isChange == true
                    //         ? const Icon(Icons.favorite)
                    //         : Icons.favorite_border
                    //       // Icons.favorite_border,
                    //       // color: Color(0xff6251DD),
                    //     ),

                    // )
                  ],
                ),
                Text(
                  content.name ?? "",
                  style: GoogleFonts.manrope(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff090937),
                  ),
                ),
                Text(
                  content.author ?? "",
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
                      content.description ?? "",
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
