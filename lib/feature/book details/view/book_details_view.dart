import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/feature/book%20details/view_model/book_details_viewmodel.dart';
import 'package:mobile_app/product/components/buttons/general_button.dart';
import 'package:mobile_app/product/service/project_dio.dart';
import 'package:mobile_app/product/text_style/text_style.dart';
import '../../../product/model/contents_model.dart';
import '../../../product/padding/padding.dart';

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

class _BookDetailsViewState extends BookDetailsViewModel with ProjectDioMixin {
  late final ContentModel content;

  @override
  void initState() {
    content = widget.content;
    // _liked = _isLiked();
    super.initState();
  }

  bool _isPressed = false;

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
                child: Text('Book Details',
                    maxLines: 8, style: GeneralTextStyle.accountTextStyle)),
          )
        ],
      ),
      body: Padding(
        padding: BookDetailsPadding().bookDetailsPadding,
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
                            icon: _isPressed
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            color: _isPressed ? Colors.red : Color(0xff6251DD),
                            onPressed: () {
                              iconButton(productId: content.id!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(content.name ?? "",
                    style: GeneralTextStyle.accountTextStyle),
                Text(content.author ?? "",
                    style: GeneralTextStyle.generalTextStyle
                        .copyWith(fontSize: 16.sp)),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 35.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Summary',
                        style: GeneralTextStyle.accountTextStyle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(content.description ?? "",
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        style: GeneralTextStyle.categoryTextStyle.copyWith(
                            color: Color(0xff090937).withOpacity(0.6))),
                  )
                ],
              ),
            ),
            const Spacer(),
            GeneralButton(
                onPressed: () {},
                buttonText: content.price.toString() ?? "",
                secondText: 'Buy Now'),
          ],
        ),
      ),
    );
  }
}
