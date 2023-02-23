import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/product/components/buttons/general_button.dart';
import 'package:mobile_app/product/service/project_dio.dart';
import '../../../product/model/contents_model.dart';

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
  const BookDetailsView({
    super.key,
    required this.content,
    required this.token,
  });
  final ContentModel content;
  final String token;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView>
    with ProjectDioMixin {
  late final ContentModel content;
  bool isChange = false;
  @override
  void initState() {
    content = widget.content;
    // _liked = _isLiked();
    super.initState();
  }

  bool _isPressed = false;
  Map<String, dynamic> getJsonFromJWT(String splittedToken) {
    String normalizedSource = base64Url.normalize(splittedToken);
    return jsonDecode(utf8.decode(base64Url.decode(normalizedSource)));
  }

  String getUserId() {
    final Map<String, dynamic> decodedToken =
        getJsonFromJWT(widget.token.split(".")[1]);

    final String userId =
        decodedToken["https://hasura.io/jwt/claims"]["x-hasura-user-id"];

    print(userId);

    return userId;
  }

  Future<void> like({required int productId}) async {
    await service.post("/like",
        data: {
          "user_id": int.parse(getUserId()),
          "product_id": productId,
        },
        options: Options(headers: {"Authorization": "Bearer ${widget.token}"}));
  }

  Future<void> unlike({required int productId}) async {
    service.post("/unlike",
        data: {
          "user_id": int.parse(getUserId()),
          "product_id": productId,
        },
        options: Options(headers: {"Authorization": "Bearer ${widget.token}"}));
  }

  void iconButton({required int productId}) {
    setState(() {
      _isPressed = !_isPressed;

      if (_isPressed) {
        like(productId: productId);
      } else {
        unlike(productId: productId);
      }
    });
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
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.network(
                          content.cover ?? "",
                          width: 150.w,
                          height: 225.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffF4F4FF),
                          child: IconButton(
                            // style: ButtonStyle(backgroundColor:  ),
                            icon: _isPressed
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            color: _isPressed ? Colors.red : Color(0xff6251DD),
                            onPressed: () {
                              iconButton(productId: content.id!);
                            },

                            // onPressed: () {
                            //   setState(() {
                            //     _liked = !_liked;
                            //     if (_liked) {
                            //       _likePost();
                            //     } else {
                            //       _unlikePost();
                            //     }
                            //   });
                            // },
                          ),
                        ),
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
                      overflow: TextOverflow.ellipsis,
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
